return {
	{
		"ledger/vim-ledger",
		version = false,
		ft = "ledger",
		keys = {
			-- { "lt", ":call ledger#transaction_state_toggle(line('.'), '*?!')<cr>", desc = "Toggle transaction" },
			-- {
			-- 	"lp",
			-- 	"<cmd>:call ledger#transaction_post_state_toggle(line('.'), '*?!')<cr>",
			-- 	desc = "Toggle posting",
			-- },
		},
		init = function()
			vim.g.ledger_maxwidth = 80
			vim.g.ledger_align_at = 60
			vim.g.ledger_fold_blanks = 0
			vim.g.ledger_fuzzy_account_completion = 1
		end,
	},
	{
		"saghen/blink.cmp",
		opts = {
			sources = {
				compat = {},
				default = { "lsp", "path", "snippets", "buffer", "omni" },
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"ledger",
			},
		},
	},
}
