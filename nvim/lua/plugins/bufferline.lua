return {
  "akinsho/bufferline.nvim",
  event = "BufReadPre",
  requires = 'nvim-tree/nvim-web-devicons',
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    { "<leader>b[", "<Cmd>BufferLineCyclePrev<CR>",            desc = "Move to left buffer" },
    { "<leader>b]", "<Cmd>BufferLineCycleNext<CR>",            desc = "Move to right buffer" }
  },
  opts = {
    options = {
      -- stylua: ignore
      -- stylua: ignore
      diagnostics = "nvim_lsp",
      always_show_bufferline = true,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          separator = true
        },
      },
    },
  },
}
