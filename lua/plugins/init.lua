-- ================================================================
-- ~/.config/nvim/lua/plugins/init.lua
-- Инициализация lazy.nvim и модульная загрузка плагинов
-- Каждый файл в lua/plugins описывает один или несколько плагинов
-- ================================================================

-- Bootstrap: установка lazy.nvim при первом запуске
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Список модульных файлов с описанием плагинов
-- Каждый модуль возвращает либо один spec, либо список specs
local modules = {
  "plugins.theme",
  "plugins.treesitter",
  "plugins.lsp",
  "plugins.cmp",
  "plugins.autotag",
  "plugins.colorizer",
  "plugins.indent_blankline",
  "plugins.bufferline",
  "plugins.lualine",
  "plugins.telescope",
  "plugins.telescope_fzf",
  "plugins.toggleterm",
  "plugins.nvim-tree",
  "plugins.git",
  "plugins.gitsigns",
  "plugins.whichkey",
  "plugins.icons",
  "plugins.trouble",
  "plugins.surround",
  "plugins.persistence",
}

-- Сборка единого списка спецификаций плагинов
local plugins = {}
for _, mod in ipairs(modules) do
  local ok, spec = pcall(require, mod)
  if ok and spec then
    -- Если модуль вернул массив specs, добавляем все элементы
    if type(spec) == "table" and type(spec[1]) == "table" then
      for _, s in ipairs(spec) do table.insert(plugins, s) end
    else
      table.insert(plugins, spec)
    end
  else
    vim.notify("Не удалось загрузить плагин-модуль: " .. tostring(mod), vim.log.levels.WARN)
  end
end

-- Запуск lazy.nvim с собранным списком плагинов
require("lazy").setup(plugins, {
  rocks = { enabled = false }, -- Отключаем поддержку luarocks (не используется) для ускорения
})
