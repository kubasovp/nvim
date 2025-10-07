-- ~/.config/nvim/lua/plugins/telescope.lua
-- Telescope + plenary

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
	cmd = "Telescope",  -- ленивое подключение
  keys = {
    { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Поиск файлов" },
    { "<leader>fg", function() require("telescope.builtin").live_grep() end,  desc = "Греп по проекту" },
    { "<leader>fb", function() require("telescope.builtin").buffers() end,    desc = "Открытые буферы" },
    { "<leader>fh", function() require("telescope.builtin").help_tags() end,  desc = "Поиск по справке" },
  },
	config = function()
    -- можно добавлять настройки по вкусу
    require("telescope").setup({})
  end,
}

