-- ~/.config/nvim/init.lua
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- Точка входа, всё остальное в lua/core и lua/plugins
-- Базовые модули (options должен идти первым, т.к. он выставляет mapleader)
require("core.options")
require("core.keymaps")
require("core.autocmds")
-- Плагины и их конфиги (lazy.nvim + список модулей в lua/plugins)
require("plugins")

