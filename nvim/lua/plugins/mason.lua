return {
	{
		"williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
		opts = {
			ui = {
        icons = {
          package_installed = "✓",
  				package_pending = "➜",
  				package_uninstalled = "✗"
    		}
    	}
		},
    config = function(_, opts)
      require("mason").setup(opts)
    end
	}
}
