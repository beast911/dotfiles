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
		{ "ellisonleao/gruvbox.nvim", name = "gruvbox", priority = 1000 },
		--	{
		--		"rebelot/kanagawa.nvim",
		--		name = "kanagawa",
		--		priority = 1000,
		--		lazy = false,
		--		config = function()
		--			require("kanagawa").load("wave")
		--		end,
		--	},
		{
			"craftzdog/solarized-osaka.nvim",
			lazy = false,
			priority = 1000,
			opts = {},
		},
		{
			"catppuccin/nvim",
			name = "catppuccin",
			priority = 1000,
			lazy = false,
			config = function()
				require("catppuccin").setup()
				vim.cmd.colorscheme("catppuccin-mocha")
			end,
		},
		{ import = "plugins" },
	},
	defaults = {
		-- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
		-- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
		lazy = true,
		-- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
		-- have outdated releases, which may break your Neovim install.
		version = false, -- always use the latest git commit
		-- version = "*", -- try installing the latest stable version for plugins that support semver
	},
	install = { colorscheme = { "catppuccin", "gruvbox", "kanagawa" } },
	checker = { enabled = true }, -- automatically check for plugin updates
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
