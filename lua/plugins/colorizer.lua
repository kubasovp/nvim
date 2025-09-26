-- показывать цвета в CSS/inline
return {
  "uga-rosa/ccc.nvim",
  event = "BufReadPost",
  opts = {
    highlighter = {
      auto_enable = true,  -- Авто-подсветка везде
      lsp = true,          -- Интеграция с LSP (для CSS/JS и т.д.)
    },
    picker = {
      enable = true,       -- Включи picker (опционально, <leader>cp для вызова)
    },
  },
  config = function(_, opts)
    require("ccc").setup(opts)
  end,
}
