-- ~/.config/nvim/lua/core/autocmds.lua
-- Различные автокоманды (здесь — полезные общие примеры)

-- Подсветка yanked текста
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() vim.hl.on_yank({ timeout = 150 }) end,
})

-- Пример: для некоторых типов файлов можно переопределить табы/инденты
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "make" },
  callback = function()
    -- для makefile обычно нужен таб
    if vim.bo.filetype == "make" then
      vim.bo.expandtab = false
    end
  end,
})

