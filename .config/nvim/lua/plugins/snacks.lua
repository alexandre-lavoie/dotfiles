local grit_lang = {
  cs = "csharp",
  css = "css",
  elixir = "elixir",
  go = "go",
  hcl = "hcl",
  html = "html",
  java = "java",
  javascript = "js",
  javascriptreact = "js",
  json = "json",
  jsonc = "json",
  jsx = "js",
  kotlin = "kotlin",
  markdown = "markdown",
  php = "php",
  python = "python",
  ruby = "ruby",
  rust = "rust",
  solidity = "solidity",
  sql = "sql",
  terraform = "hcl",
  toml = "toml",
  tsx = "js",
  typescript = "js",
  typescriptreact = "js",
  vue = "vue",
  yaml = "yaml",
  ["yaml.ansible"] = "yaml",
}

local function decode_grit_event(line)
  local ok, event = pcall(vim.json.decode, line)
  if ok then
    return event
  end

  ok, line = pcall(vim.json.decode, '"' .. line .. '"')
  if ok then
    ok, event = pcall(vim.json.decode, line)
    if ok then
      return event
    end
  end
end

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = { 
      enabled = true,
      preset = {
        header = [[
  __  _   _____   ___   _  _ __ __  
 /  \| | | __\ \_/ / \ / || |  V  | 
| /\ | |_| _| > , <`\ V /'| | \_/ | 
|_||_|___|___/_/ \_\ \_/  |_|_| |_| ]],
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { pane = 1, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 1, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 1,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
      },
    },
    indent = { enabled = true },
    input = { enabled = true },
    lazygit = { enabled = true },
    picker = {
      enabled = true,
      win = {
        input = {
          keys = {
            ["<A-Up>"] = { "history_back", mode = { "i", "n" } },
            ["<A-Down>"] = { "history_forward", mode = { "i", "n" } },
          },
        },
      },
      sources = {
        grit_search = {
          title = "Grit Search",
          format = "file",
          notify = false,
          show_empty = true,
          live = true,
          supports_live = true,

          finder = function(opts, ctx)
            local query, extra_args = Snacks.picker.util.parse(ctx.filter.search)

            local args = {
              "apply",
              "--jsonl",
              "--cache",
              "--dry-run",
              query,
            }

            vim.list_extend(args, extra_args)

            local lang = grit_lang[opts.grit_ft]
            print(opts.grit_ft)
            if lang then
              vim.list_extend(args, { "--language", lang })
            end

            local grit_finder = require("snacks.picker.source.proc").proc({
              cmd = "grit",
              args = args,
              cwd = opts.cwd,
              notify = false,

              transform = function(item)
                local match = decode_grit_event(item.text)
                if not match or match.__typename ~= "Match" or not match.sourceFile then
                  return false
                end

                item.match = match
              end,
            }, ctx)

            return function(emit)
              local pending = 0

              grit_finder(function(item)
                pending = pending + 1

                vim.schedule(function()
                  local ok, err = pcall(function()
                    local lines = vim.split(item.match.content, "\n", { plain = true })

                    for _, range in ipairs(item.match.ranges or {}) do
                      local line = lines[range.start.line]
                      local positions = {}

                      local last_col = range["end"].line == range.start.line and range["end"].column - 1 or #line
                      for col = range.start.column, last_col do
                        positions[#positions + 1] = col
                      end

                      emit({
                        file = item.match.sourceFile:gsub("^%./", ""),
                        pos = { range.start.line, range.start.column },
                        line = line,
                        positions = positions,
                      })
                    end
                  end)

                  if not ok then
                    vim.notify(err, vim.log.levels.ERROR)
                  end

                  pending = pending - 1

                  if pending == 0 then
                    ctx.async:resume()
                  end
                end)
              end)

              if pending > 0 then
                ctx.async:suspend()
              end
            end
          end
        },
      },
    },
    rename = { enabled = true },
    terminal = { enabled = true },
    words = {
      enabled = true,
      debounce = 200,
      modes = { "n", "i", "c" },
    },
  },
}
