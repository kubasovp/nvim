-- nvim-telescope/telescope-fzf-native.nvim — ускорение telescope
return {
  "nvim-telescope/telescope-fzf-native.nvim",
  build = "make",
  cond = function()
    return vim.fn.executable("make") == 1
  end,
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    -- загружаем расширение fzf (если telescope уже загружен)
    local ok, _ = pcall(require, "telescope")
    if ok then
      require("telescope").load_extension("fzf")
    end
  end,
}

