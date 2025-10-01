-- ~/.config/nvim/lua/plugins/git.lua
-- Несколько git-плагинов и быстродоступные хоткеи

return {
  -- Lazygit wrapper
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
    end,
  },
}

