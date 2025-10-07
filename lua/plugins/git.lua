-- =======================================================================
-- ~/.config/nvim/lua/plugins/git.lua
-- kdheepak/lazygit.nvim — интеграция LazyGit (TUI-интерфейс Git)
-- =======================================================================

return {
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Открыть LazyGit" })
    end,
  },
}

