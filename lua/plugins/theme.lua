-- ~/.config/nvim/lua/plugins/theme.lua
-- Тема Solarized (загружается с приоритетом)

return {
  "shaunsingh/solarized.nvim",
  priority = 1000,
  config = function()
    -- светлый фон по умолчанию
    vim.o.background = "light"
    vim.cmd.colorscheme("solarized")
  end,
}

