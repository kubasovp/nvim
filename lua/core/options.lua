-- ~/.config/nvim/lua/core/options.lua
-- Базовые параметры редактора
local o = vim.opt
-- Номера строк
o.number = true
o.relativenumber = true

-- Tab / indent (табы по умолчанию)
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = false
o.smartindent = true

-- Цвета и лидер
o.termguicolors = true
vim.g.mapleader = " "  -- лидер — пробел

-- Другие опции (можно отключать/добавлять)
o.clipboard = "unnamedplus"   -- системный буфер обмена
o.cursorline = true
o.splitright = true
o.splitbelow = true

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = false
