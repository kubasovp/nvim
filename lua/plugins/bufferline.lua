-- akinsho/bufferline.nvim (VSCode-like tabs)
return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy", -- lazy load
  config = function()
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",
        indicator = { icon = '▎', style = 'icon' },
        show_buffer_close_icons = true,
        show_close_icon = false,
        separator_style = "thin",
      },
    })
  end,
}

