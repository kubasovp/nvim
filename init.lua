-- ================================================================
-- ~/.config/nvim/init.lua
-- Основной init-файл Neovim
-- Точка входа конфигурации: инициализация базовых настроек и плагинов
-- Все остальные настройки вынесены в lua/core и lua/plugins
-- ================================================================

-- Отключаем ненужные внешние провайдеры для ускорения загрузки
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- Базовые модули ядра
-- Важно: options должен идти первым, так как задаёт mapleader и общие настройки
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- Плагины и их конфигурация (lazy.nvim + модульные файлы в lua/plugins)
require("plugins")

