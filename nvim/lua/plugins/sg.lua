-- Use your favorite package manager to install, for example in lazy.nvim
--  Optionally, you can also install nvim-telescope/telescope.nvim to use some search functionality.
return {
	{
		"sourcegraph/sg.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim", --[[ "nvim-telescope/telescope.nvim ]]
		},

		-- If you have a recent version of lazy.nvim, you don't need to add this!
		config = function()
			require("sg").setup()
		end,
	},
}
