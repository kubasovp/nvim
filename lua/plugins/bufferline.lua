-- =======================================================================
-- ~/.config/nvim/lua/plugins/bufferline.lua
--  Плагин: akinsho/bufferline.nvim — вкладки в стиле VSCode
--  Отображает буферы и LSP-диагностику в верхней панели
-- =======================================================================

return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",             -- Интеграция с диагностикой LSP
        indicator = { icon = "▎", style = "icon" },
        show_buffer_close_icons = true,
        show_close_icon = false,
        separator_style = "thin",             -- Тонкие разделители
      },
    })
  end,
}

