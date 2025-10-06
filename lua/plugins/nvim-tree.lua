-- ~/.config/nvim/lua/plugins/nvim-tree.lua
-- Файловое дерево
-- ~/.config/nvim/lua/plugins/nvim-tree.lua
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvim_tree = require("nvim-tree")

    nvim_tree.setup({
      -- Подсветка активного файла и автоматическое раскрытие дерева
      update_focused_file = {
        enable = true,       -- следить за активным файлом
        update_root = false, -- не менять корень проекта
        ignore_list = {},
      },
      view = {
        width = 35,
        side = "left",
        adaptive_size = true,
        preserve_window_proportions = true,
      },
      renderer = {
        highlight_opened_files = "all", -- подсвечивать открытые файлы
        indent_markers = { enable = true },
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
      actions = {
        open_file = {
          resize_window = true,
          quit_on_open = false, -- не закрывать дерево при открытии файла
        },
      },
      git = {
        enable = true,
        ignore = false,
      },
    })

    -- Автообновление дерева при смене буфера (подсветка активного файла)
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        if require("nvim-tree.api").tree.is_visible() then
          pcall(require("nvim-tree.api").tree.find_file, true)
        end
      end,
    })

    -- Кеймап для переключения дерева
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Tree" })
  end,
}

