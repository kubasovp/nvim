-- lukas-reineke/indent-blankline.nvim (направляющие уровня вложенности)
return {
  "lukas-reineke/indent-blankline.nvim",
	main = "ibl",
  event = "BufReadPost",
  opts = {
    indent = {
      char = "┊",
			highlight = "IndentGrey"
    },
    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
			highlight = { "IndentScope" },
    },
		exclude = {
      filetypes = { "help", "terminal", "dashboard", "packer" },
    },
  },
	config = function(_, opts)
    -- создаём группу подсветки
    vim.api.nvim_set_hl(0, "IndentGrey", { fg = "#dddddd", nocombine = true })  -- светло-серый
    vim.api.nvim_set_hl(0, "IndentScope", { fg = "#7aa2f7", nocombine = true }) -- голубой
    require("ibl").setup(opts)
  end,
}

