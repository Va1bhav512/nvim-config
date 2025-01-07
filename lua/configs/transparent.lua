require("transparent").setup({
  groups = {
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
    'EndOfBuffer',
  },
  extra_groups = {
    "NormalFloat",      -- floating windows
    "NvimTreeNormal",   -- NvimTree panel
    "BufferLine",       -- BufferLine plugin
  },
  exclude_groups = {},  -- Exclude any groups you don't want to clear
  on_clear = function()
    -- Optional: code to run after clearing the highlight groups
  end,
})
