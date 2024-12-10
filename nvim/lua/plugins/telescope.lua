return {
	"nvim-telescope/telescope.nvim",
	commit = vim.fn.has("nvim-0.9.0") == 0 and "057ee0f8783" or nil,
	cmd = "Telescope",
	lazy = false,
	version = false, -- telescope did only one release, so use HEAD for now
	dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
	config = function()
		require("telescope").setup({
	--		extensions = {
	--			fzf = {
	--				fuzzy = true, -- false will only do exact matching
	--				override_generic_sorter = true, -- override the generic sorter
	--				override_file_sorter = true, -- override the file sorter
	--				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
	--				-- the default case_mode is "smart_case"
	--			},
	--		},
		})
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", "<Cmd>Telescope find_files hidden=true <cr>", {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})
		vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, {})

		-- require("telescope").load_extension("fzf")
	end,
}
