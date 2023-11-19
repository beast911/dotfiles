local keymap = require("config.keymaps").map
return {
	"kdheepak/lazygit.nvim",
	lazy = false,
	-- optional for floating window border decoration
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").load_extension("lazygit")
		keymap("n", "<leader>g", "<Cmd>LazyGit<CR>")
	end,
}
