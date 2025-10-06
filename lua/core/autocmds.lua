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

-- всегда ставим cwd в корень проекта
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() > 0 then
      local arg = vim.fn.argv(0)
      if vim.fn.isdirectory(arg) == 1 then
        -- если открыли каталог → cwd = каталог
        vim.cmd("cd " .. vim.fn.fnamemodify(arg, ":p"))
      else
        -- если открыли файл → cwd = git root
        local git_root = vim.fn.systemlist(
          "git -C " .. vim.fn.fnamemodify(arg, ":p:h") .. " rev-parse --show-toplevel"
        )[1]
        if git_root and #git_root > 0 then
          vim.cmd("cd " .. git_root)
        end
      end
    end
  end,
})

