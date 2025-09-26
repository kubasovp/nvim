-- ~/.config/nvim/lua/plugins/telescope.lua
-- Telescope + plenary

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    -- можно добавлять настройки по вкусу
    require("telescope").setup({})
  end,
}

