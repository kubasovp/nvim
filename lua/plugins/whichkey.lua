-- ~/.config/nvim/lua/plugins/whichkey.lua
-- which-key для подсказок по комбинациям

return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")
    wk.setup({})

    -- Регистрируем группы для лидера — новый формат v3+
		wk.add({
      -- все группы начинаем с <leader>
      { "<leader>f", group = "Файлы/Поиск" },
      { "<leader>t", group = "Терминал" },
      { "<leader>h", group = "Help/Документация" },
      {
        "<leader>g",
        group = "Git",
        { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        { "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
        { "<leader>gb", "<cmd>Git blame<cr>", desc = "Blame line" },
      },
    })
  end,
}
