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
			"Shatur/neovim-ayu",
			priority = 1000,
		},
		{
			"neanias/everforest-nvim",
			version = false,
			lazy = false,
			priority = 1000, -- make sure to load this before all the other start plugins
		},
		{
			"sainnhe/sonokai",
			priority = 1000,
		},
		{
			"catppuccin/nvim",
			name = "catppuccin",
			priority = 1000,
		},
		{
			"folke/tokyonight.nvim",
			lazy = false,
			priority = 1000,
			opts = {},
			config = function()
				require("tokyonight").setup({
					-- use the night style
					style = "night",
					-- disable italic for functions
					styles = {
						functions = {},
					},
					on_highlights = function(hl, c)
						local prompt = "#2d3149"
						hl.TelescopeNormal = {
							bg = c.bg_dark,
							fg = c.fg_dark,
						}
						hl.TelescopeBorder = {
							bg = c.bg_dark,
							fg = c.bg_dark,
						}
						hl.TelescopePromptNormal = {
							bg = prompt,
						}
						hl.TelescopePromptBorder = {
							bg = prompt,
							fg = prompt,
						}
						hl.TelescopePromptTitle = {
							bg = prompt,
							fg = prompt,
						}
						hl.TelescopePreviewTitle = {
							bg = c.bg_dark,
							fg = c.bg_dark,
						}
						hl.TelescopeResultsTitle = {
							bg = c.bg_dark,
							fg = c.bg_dark,
						}
					end,
					sidebars = { "qf", "vista_kind", "terminal", "packer" },
					-- Change the "hint" color to the "orange" color, and make the "error" color bright red
					on_colors = function(colors)
						colors.bg = "#000000"
					end,
				})
			end,
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
