local async_formatting = function(bufnr)
	opts = opts or {}
	opts.silent = opts.silent ~= false
	if opts.remap and not vim.g.vscode then
		opts.remap = nil
	end
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- modes n, x, i, v

vim.keymap.set("n", "gf", function()
	if require("obsidian").util.cursor_on_markdown_link() then
		return "<cmd>ObsidianFollowLink<CR>"
	else
		return "gf"
		if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
				return
			end

			if res then
				local client = vim.lsp.get_client_by_id(ctx.client_id)
				vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
				vim.api.nvim_buf_call(bufnr, function()
					vim.cmd("silent noautocmd update")
				end)
			end
		end
	)
end

return {
	"jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "mason.nvim" },
	config = function()
		-- custom/configs/null-ls.lua

		local null_ls = require("null-ls")

		local formatting = null_ls.builtins.formatting
		local lint = null_ls.builtins.diagnostics
		local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
		local event = "BufWritePre" -- or "BufWritePost"
		local async = event == "BufWritePost"

		local sources = {
			formatting.prettier.with({
				env = {
					PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/git_clones/flights/frontend/.prettierrc"),
				},
			}),
			formatting.stylua,
			-- lint.shellcheck,
		}

		null_ls.setup({
			debug = false,
			sources = sources,
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.keymap.set("n", "<Leader>f", function()
						vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
					end, { buffer = bufnr, desc = "[lsp] format" })

					-- format on save
					vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
					vim.api.nvim_create_autocmd("BufWritePost", {
						buffer = bufnr,
						group = group,
						callback = function()
							async_formatting(bufnr)
							-- vim.lsp.buf.format({ bufnr = bufnr, async = async, timeout_ms = 2000 })
						end,
						desc = "[lsp] format on save",
					})
				end

				if client.supports_method("textDocument/rangeFormatting") then
					vim.keymap.set("x", "<Leader>f", function()
						vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
					end, { buffer = bufnr, desc = "[lsp] format" })
				end
			end,
		})
	end,
}
