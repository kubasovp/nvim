-- ~/.config/nvim/lua/plugins/git.lua
-- Несколько git-плагинов и быстродоступные хоткеи

return {
  -- Neogit
  {
    "NeogitOrg/neogit",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Neogit" })
    end,
  },

  -- Lazygit wrapper
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
    end,
  },

  -- Fugitive
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gs", "<cmd>Git<cr>", { desc = "Git status" })
    end,
  },
}

