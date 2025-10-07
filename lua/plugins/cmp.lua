-- =======================================================================
-- ~/.config/nvim/lua/plugins/cmp.lua
--  Плагин: hrsh7th/nvim-cmp — автодополнение
--  Настройка LSP, буфера и путей как источников подсказок
-- =======================================================================

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",   -- Источник: LSP
    "hrsh7th/cmp-buffer",     -- Источник: текст текущего буфера
    "hrsh7th/cmp-path",       -- Источник: пути файлов
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),            -- Вызов автодополнения вручную
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Принятие выбранного варианта
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
}

