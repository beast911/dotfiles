return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  main = "ibl",
  show_current_context = true,
  config = function()
    vim.opt.termguicolors = true
    require("ibl").setup({
      indent = {
        char = "│",
      },
    })
  end,
}
