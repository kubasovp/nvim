-- folke/trouble.nvim (вывод ошибок и ворнингов)
return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
  config = function()
    require("trouble").setup({
      auto_open = false,
      auto_close = true,
      use_diagnostic_signs = true,
    })
  end,
}

