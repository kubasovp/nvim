-- ~/.config/nvim/lua/plugins/lsp.lua
-- LSP: mason + mason-lspconfig + lspconfig

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",     -- capabilities для nvim-cmp
  },
  config = function()
    local servers = { "ts_ls", "eslint", "svelte", "intelephense", "html", "cssls", "lua_ls" }

    -- Mason
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = servers,
      automatic_installation = true,
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Красивый hover в плавающем окне
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
			vim.lsp.handlers.hover,
			{
				border = "rounded", -- рамка: "single", "double", "shadow", "rounded"
				max_width = 80,
			}
		)

		-- Аналогично для сигнатур (подсказка по аргументам функций)
		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
			vim.lsp.handlers.signature_help,
			{
				border = "rounded",
				max_width = 80,
			}
		)

		-- Хелпер для форматирования только eslint
		local function eslint_format(bufnr, async)
			vim.lsp.buf.format({
				async = async,
				filter = function(client) return client.name == "eslint" end,
				bufnr = bufnr,
			})
		end

		local on_attach = function(client, bufnr)
			if client.name == "ts_ls" then
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end

			-- Ручное форматирование
			vim.keymap.set("n", "<leader>f", function()
				eslint_format(bufnr, true)  -- async = true
			end, { buffer = bufnr, desc = "Форматировать (eslint)" })

			-- Автоформат на сохранение
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				callback = function()
					eslint_format(bufnr, false)  -- sync = false
				end,
			})

			local map = function(keys, func, desc)
				vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
			end

			map("K", vim.lsp.buf.hover, "Hover")
			map("gd", vim.lsp.buf.definition, "Go to definition")
			map("gr", vim.lsp.buf.references, "References")
			map("gi", vim.lsp.buf.implementation, "Go to implementation")
			map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
			map("<leader>ca", vim.lsp.buf.code_action, "Code action")
			map("<leader>ld", vim.diagnostic.open_float, "Diagnostics")
		end

    -- Настройка каждого сервера вручную (новый подход)
    for _, server in ipairs(servers) do
      local opts = {
				name = server, -- Имя сервера для vim.lsp
        capabilities = capabilities,
        on_attach = on_attach,
      }

      if server == "ts_ls" then
        opts.init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = vim.fn.stdpath("data") .. "/mason/packages/vue-language-server/node_modules/@vue/typescript-plugin",
              languages = { "javascript", "typescript", "vue" },
            },
          },
        }
        opts.filetypes = { "javascript", "typescript", "vue" }
      elseif server == "eslint" then
        opts.settings = {
          format = { enable = true },
          codeActionOnSave = { enable = true, mode = "all" },
        }
			elseif server == "lua_ls" then
        opts.settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false, -- убирает ворнинги про "неизвестные библиотеки"
            },
            telemetry = { enable = false },
          },
        }
      end

			vim.lsp.config(server, opts)
      vim.lsp.enable(server)
    end
  end,
}
