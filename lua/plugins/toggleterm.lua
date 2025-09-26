-- ~/.config/nvim/lua/plugins/toggleterm.lua
-- ToggleTerm + несколько терминалов и хоткеи

-- ~/.config/nvim/lua/plugins/toggleterm.lua
return {
  "akinsho/toggleterm.nvim",
  config = function()
    local ok, toggleterm = pcall(require, "toggleterm")
    if not ok then return end

    toggleterm.setup({
      size = 15,
      open_mapping = [[<C-\>]],
      direction = "horizontal",
      autochdir = true,
      start_in_insert = true,
      persist_size = true,
      insert_mappings = false,   -- не включаем автo-мапы insert/terminal, сделаем свои
      terminal_mappings = false,
      close_on_exit = false,
    })

    local Terminal = require("toggleterm.terminal").Terminal

    -- создаём терминалы и даём им count (1,2,3) — тогда :1ToggleTerm/:2ToggleTerm будут работать
    local term_dev   = Terminal:new({ cmd = "fish",    count = 1, direction = "horizontal", size = 15 })
    local term_git   = Terminal:new({ cmd = "lazygit", count = 2, direction = "horizontal", size = 15 })
    local term_other = Terminal:new({ cmd = "fish",    count = 3, direction = "horizontal", size = 15 })

    -- Normal mode — вызываем команду по номеру (надёжно)
    vim.keymap.set("n", "<leader>1", "<cmd>1ToggleTerm<CR>", { desc = "Toggle Dev Term" })
    vim.keymap.set("n", "<leader>2", "<cmd>2ToggleTerm<CR>", { desc = "Toggle Git Term" })
    vim.keymap.set("n", "<leader>3", "<cmd>3ToggleTerm<CR>", { desc = "Toggle Other Term" })

    -- Terminal mode — сначала выйти в нормал, потом выполнить ту же команду
    vim.keymap.set("t", "<leader>1", [[<C-\><C-n>:1ToggleTerm<CR>]], { desc = "Toggle Dev Term (from terminal)", noremap=true, silent=true })
    vim.keymap.set("t", "<leader>2", [[<C-\><C-n>:2ToggleTerm<CR>]], { desc = "Toggle Git Term (from terminal)", noremap=true, silent=true })
    vim.keymap.set("t", "<leader>3", [[<C-\><C-n>:3ToggleTerm<CR>]], { desc = "Toggle Other Term (from terminal)", noremap=true, silent=true })

    -- Гарантируем, что Esc и удобная навигация работают в терминале
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*",
      callback = function()
        local opts = { noremap = true, silent = true }
        -- Esc -> выйти в normal mode
        vim.api.nvim_buf_set_keymap(0, "t", "<Esc>", [[<C-\><C-n>]], opts)
        -- навигация из терминала
        vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
        vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
        vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
        vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
      end,
    })
  end,
}

