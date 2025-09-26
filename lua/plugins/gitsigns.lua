-- ~/.config/nvim/lua/plugins/gitsigns.lua
-- Gitsigns с навигацией по hunk и базовыми хоткеями

return {
  "lewis6991/gitsigns.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
			current_line_blame = true,
			current_line_blame_opts = {
				delay = 500,
				virt_text_pos = "eol", -- позиция текста: "eol" | "overlay" | "right_align"
			},
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Навигация по hunk'ам
        map({ "n", "v" }, "]c", function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() gs.next_hunk() end)
          return "<Ignore>"
        end, { expr = true, desc = "Next hunk" })

        map({ "n", "v" }, "[c", function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() gs.prev_hunk() end)
          return "<Ignore>"
        end, { expr = true, desc = "Prev hunk" })

        -- Stage / reset
        map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
        map("n", "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })

        -- Blame
        map("n", "<leader>gb", gs.current_line_blame, { desc = "Toggle inline blame" })
      end,
    })
  end,
}

