-- =======================================================================
-- ~/.config/nvim/lua/plugins/colorizer.lua
--  Плагин: uga-rosa/ccc.nvim — отображение цветов (#rrggbb, rgb() и т.д.)
--  Автоматическая подсветка и поддержка LSP
-- =======================================================================

return {
  "uga-rosa/ccc.nvim",
  event = "BufReadPost",
  opts = {
    highlighter = {
      auto_enable = true,  -- Автоматически включать подсветку цветов
      lsp = true,          -- Поддержка LSP (например, для CSS)
    },
    picker = {
      enable = true,       -- Включает color picker (<leader>cp)
    },
  },
  config = function(_, opts)
    require("ccc").setup(opts)
  end,
}

