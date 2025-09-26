-- ~/.config/nvim/lua/plugins/treesitter.lua
-- Treesitter: синтаксическая подсветка, indent и selection

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "javascript", "typescript", "tsx", "html", "css", "json", "vue", "svelte", "php", "lua", "bash", },
      highlight = { enable = true },
      incremental_selection = { enable = true },
      indent = { enable = true },
    })
  end,
}

