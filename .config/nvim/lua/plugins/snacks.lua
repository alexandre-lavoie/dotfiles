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
    picker = { enabled = true },
    rename = { enabled = true },
    terminal = { enabled = true },
    words = {
      enabled = true,
      debounce = 200,
      modes = { "n", "i", "c" },
    },
  },
}
