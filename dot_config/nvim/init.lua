vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		}
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		"alker0/chezmoi.vim",
		lazy = false,
		init = function()
			vim.g['chezmoi#use_tmp_buffer'] = true
		end,
	},
})

require("noice").setup({
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	presets = {
		bottom_search = true,
		command_palette = true,
		long_message_to_split = true,
		inc_rename = false,
		lsp_doc_border = false,
	},
})

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		-- should always be installed
		"c",
		"lua",
		"vim",
		"vimdoc",
		"query",
		-- for noice
		"bash",
		"markdown",
		"markdown_inline",
		"regex",
		-- other
		"yaml",
		"json",
		"toml",
		"fish",
		"go",
		"rust",


	},
	sync_install = false,
	highlight = {
		enable = true
	},
	indent = {
		enable = true,
	},
})
