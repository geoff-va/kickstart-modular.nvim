return {
	dir = "/Users/geoff/Documents/projects/nvim-tmux-pytest/",
	opts = {
		base_cmd = "pytest --disable-warnings --no-migrations",
	},
	keys = {
		{ "<leader>tf", "<cmd>TPRunFunction<cr>", desc = "TP: Run function/method" },
		{ "<leader>tc", "<cmd>TPRunClass<cr>", desc = "TP: Run Class" },
		{ "<leader>tw", "<cmd>TPSelectWindow<cr>", desc = "TP: Select target window" },
	},
}
