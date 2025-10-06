-- folke/persistence.nvim — менеджер сессий
return {
  {
    "folke/persistence.nvim",
		lazy = false,
    opts = {
      dir = vim.fn.stdpath("state") .. "/sessions/",
      options = { "buffers", "curdir", "tabpages", "winsize" },
      pre_save = function()
        vim.api.nvim_exec_autocmds("User", { pattern = "PersistenceSavePre" })
      end,
      post_load = function()
        vim.api.nvim_exec_autocmds("User", { pattern = "PersistenceLoadPost" })
      end,
    },
    config = function(_, opts)
      local persistence = require("persistence")
      persistence.setup(opts)

      -- Хук: открываем nvim-tree после загрузки
      vim.api.nvim_create_autocmd("User", {
        pattern = "PersistenceLoadPost",
        callback = function()
					vim.schedule(function()
						local ok, api = pcall(require, "nvim-tree.api")
						if not ok then return end 

						if not api.tree.is_visible() then
							api.tree.open({ find_file = true, focus = false })
						else
							api.tree.find_file({ open = true, focus = false })
						end

						-- Перемещаем фокус на активный буфер с файлом (чтобы не оставался на дереве)
						local cur_buf = vim.api.nvim_get_current_buf()
						vim.defer_fn(function()
							-- ищем первый нормальный буфер, не нулевой
							for _, buf in ipairs(vim.api.nvim_list_bufs()) do
								if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_option(buf, "buflisted") then
									vim.api.nvim_set_current_buf(buf)
									break
								end
							end
						end, 50)
      		end)
				end,
      })

      -- Автозагрузка сессии при старте, но только если открыт каталог
			vim.api.nvim_create_autocmd("VimEnter", {
				callback = function()
					local argc = vim.fn.argc()
					if argc == 0 then return end

					local argv0 = vim.fn.argv(0)
					local target_dir
					if vim.fn.isdirectory(argv0) == 1 then
						target_dir = vim.fn.fnamemodify(argv0, ":p")
					else
						-- если открыт файл, ищем git root
						local git_root = vim.fn.systemlist("git -C " .. vim.fn.fnamemodify(argv0, ":p:h") .. " rev-parse --show-toplevel")[1]
						if git_root and #git_root > 0 then
							target_dir = git_root
						else
							target_dir = vim.fn.fnamemodify(argv0, ":p:h")
						end
					end

					-- меняем cwd на проект
					vim.cmd("cd " .. vim.fn.fnameescape(target_dir))

					-- автозагрузка сессии для cwd
					vim.schedule(function()
						local ok = persistence.load({ dir = opts.dir, autosave = true })
						vim.notify("[persistence] session loaded: " .. tostring(ok), vim.log.levels.INFO)
					end)
				end
			})

      -- Кеймапы для ручного управления
      vim.keymap.set("n", "<leader>qs", function() persistence.load() end,
        { desc = "Восстановить сессию для текущей директории" })
      vim.keymap.set("n", "<leader>ql", function() persistence.load({ last = true }) end,
        { desc = "Восстановить последнюю сессию" })
      vim.keymap.set("n", "<leader>qd", function() persistence.stop() end,
        { desc = "Остановить сохранение сессии" })
      vim.keymap.set("n", "<leader>qS", function() persistence.select() end,
        { desc = "Выбрать сессию вручную" })
    end,
  }
}

