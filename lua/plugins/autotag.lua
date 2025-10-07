--- =======================================================================
-- ~/.config/nvim/lua/plugins/autotag.lua
--  Плагин: windwp/nvim-ts-autotag — автозакрытие HTML/JSX тегов
--  Работает совместно с Treesitter, автоматически завершает и переименовывает теги
-- =======================================================================- 

return {
  "windwp/nvim-ts-autotag",
  event = { "InsertEnter", "BufReadPost" },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("nvim-ts-autotag").setup({})
  end,
}

