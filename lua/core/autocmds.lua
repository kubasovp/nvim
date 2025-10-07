-- =======================================================================
-- ~/.config/nvim/lua/core/autocmds.lua
--  Core: Автокоманды
--  Здесь определяются общие автоматические действия при событиях Neovim
-- =======================================================================

-- Подсветка текста после yank (копирования)
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.hl.on_yank({ timeout = 150 })
  end,
})

-- Автоматически менять текущий каталог (cwd)
-- - eсли открыт каталог → переходим в него
-- - eсли открыт файл → переходим в корень git-проекта (если найден)
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() > 0 then
      local arg = vim.fn.argv(0)
      if vim.fn.isdirectory(arg) == 1 then
        vim.cmd("cd " .. vim.fn.fnamemodify(arg, ":p"))
      else
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
