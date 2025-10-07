-- =======================================================================
-- ~/.config/nvim/lua/core/keymaps.lua
--  Core: Горячие клавиши (только базовые, вне плагинов)
-- =======================================================================

local map = vim.keymap.set

-- Буферы (управление файлами)
map("n", "<S-l>", ":BufferLineCycleNext<CR>", { desc = "Следующий буфер" })
map("n", "<S-h>", ":BufferLineCyclePrev<CR>", { desc = "Предыдущий буфер" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Закрыть буфер" })

-- Диагностика LSP
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostics" })
