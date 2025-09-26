-- windwp/nvim-ts-autotag — закрытие/переименование html/vue/svelte тегов
return {
  "windwp/nvim-ts-autotag",
  event = { "InsertEnter", "BufReadPost" },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("nvim-ts-autotag").setup({})
  end,
}

