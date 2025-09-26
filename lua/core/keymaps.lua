-- ~/.config/nvim/lua/core/keymaps.lua
-- Все пользовательские хоткеи здесь
local map = vim.keymap.set

-- Навигация по вкладкам
map("n", "gt", ":tabnext<CR>", { desc = "Следующая вкладка" })
map("n", "gT", ":tabprevious<CR>", { desc = "Предыдущая вкладка" })

-- ToggleTerm (простое переключение)
map("n", "<leader>tn", ":ToggleTerm<CR>", { desc = "Toggle терминал" })

-- Telescope — используем замыкания, require выполнится при нажатии
map("n", "<leader>ff", function() require("telescope.builtin").find_files() end, { desc = "Поиск файлов" })
map("n", "<leader>fg", function() require("telescope.builtin").live_grep() end, { desc = "Греп по проекту" })
map("n", "<leader>fb", function() require("telescope.builtin").buffers() end, { desc = "Открытые буферы" })
map("n", "<leader>fh", function() require("telescope.builtin").help_tags() end, { desc = "Help" })
-- bufferline.nvim navigation
map("n", "<S-l>", ":BufferLineCycleNext<CR>", { desc = "Следующий буфер" })
map("n", "<S-h>", ":BufferLineCyclePrev<CR>", { desc = "Предыдущий буфер" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Закрыть буфер" })
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostics" })

