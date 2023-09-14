local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    {
      "sainnhe/sonokai",
      priority = 1000
    },
    {
      "rockyzhang24/arctic.nvim",
      dependencies = { "rktjmp/lush.nvim" },
      name = "arctic",
      branch = "main",
      priority = 1000,
    },
    { 'projekt0n/github-nvim-theme' },
    { "bluz71/vim-moonfly-colors",  name = "moonfly", lazy = false, priority = 1000 },
    { "savq/melange-nvim",          priority = 1000 },
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
    },
    {
      "neanias/everforest-nvim",
      version = false,
      lazy = false,
      priority = 1000, -- make sure to load this before all the other start plugins
    },
    { 'dasupradyumna/midnight.nvim', lazy = false,     priority = 1000 },
    { "cpea2506/one_monokai.nvim",   name = "monokai", priority = 1000 },
    { "ellisonleao/gruvbox.nvim",    priority = 1000 },
    {
      "rebelot/kanagawa.nvim",
      name = "kanagawa",
      config = function()
        require("kanagawa").setup {}
      end
    },
    {
      "navarasu/onedark.nvim",
      priority = 1000,
    },
    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
      config = function()
        require("tokyonight").setup {}
      end
    },
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "catppuccin", "tokyonight", "habamax", "monokai" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
