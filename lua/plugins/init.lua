-- ~/.config/nvim/lua/plugins/init.lua
-- Bootstrap lazy.nvim и загрузка модульных описаний плагинов

-- Bootstrap lazy.nvim (если ещё не установлен)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Список модулей (каждый модуль возвращает либо одну спецификацию плагина, либо table of specs)
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

-- Собираем плоский список спецификаций для lazy.setup
local plugins = {}
for _, mod in ipairs(modules) do
  local ok, spec = pcall(require, mod)
  if ok and spec then
    -- если модуль вернул список (spec[1] — table), добавляем все элементы
    if type(spec) == "table" and type(spec[1]) == "table" then
      for _, s in ipairs(spec) do table.insert(plugins, s) end
    else
      table.insert(plugins, spec)
    end
  else
    vim.notify("Не удалось загрузить плагин-модуль: " .. tostring(mod), vim.log.levels.WARN)
  end
end

-- Запускаем lazy.setup с собранным списком
require("lazy").setup(plugins, {
  rocks = { enabled = false },
})

