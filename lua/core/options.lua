-- =======================================================================
-- ~/.config/nvim/lua/core/options.lua
--  Core: Базовые настройки редактора
--  Общие параметры отображения, поведения и интерфейса
-- =======================================================================

local o = vim.opt

-- Нумерация строк
o.number = true
o.relativenumber = true

-- Отступы и табы (по умолчанию)
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = false
o.smartindent = true

-- Цвета и оформление
o.termguicolors = true

-- Лидер-клавиша
vim.g.mapleader = " " -- пробел

-- Поведение окон и буфера обмена
o.clipboard = "unnamedplus"   -- использовать системный буфер
o.cursorline = true           -- подсветка текущей строки
o.splitright = true           -- новые вертикальные окна справа
o.splitbelow = true           -- новые горизонтальные окна снизу

-- Сворачивание (folds) через Treesitter
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = false

