-- folke/persistence.nvim — менеджер сессий
return {
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		config = function()
			require("persistence").setup({
				dir = vim.fn.stdpath("state") .. "/sessions/", -- куда сохранять
				options = { "buffers", "curdir", "tabpages", "winsize" },
			})
			-- Автозагрузка последней сессии, если директория содержит сессию
			-- автозагрузка последней сессии при старте
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          local ok, _ = pcall(require("persistence").load, { last = true })
        end,
      })

			vim.keymap.set("n", "<leader>qs", function()
				require("persistence").load()
			end, { desc = "Restore session for current directory" })

			vim.keymap.set("n", "<leader>ql", function()
				require("persistence").load({ last = true })
			end, { desc = "Restore last session" })

			vim.keymap.set("n", "<leader>qd", function()
				require("persistence").stop()
			end, { desc = "Stop persistence (don’t save session)" })
		end,
	}
}

