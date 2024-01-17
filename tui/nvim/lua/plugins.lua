local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	print("plugins.lua")
	return
end
-- Install plugins here --
lazy.setup({
	"folke/lazy.nvim",
	"nvim-lua/plenary.nvim",
	"nvim-lua/popup.nvim",
	"nvim-tree/nvim-web-devicons",
	"nvim-tree/nvim-tree.lua",
	"echasnovski/mini.nvim",
	"moll/vim-bbye",
	{ "turbio/bracey.vim", build = "npm install --prefix server" },
	"akinsho/toggleterm.nvim",
	"nvim-lualine/lualine.nvim",
	"goolord/alpha-nvim",
	"antoinemadec/FixCursorHold.nvim",
	"folke/which-key.nvim",
	"lambdalisue/suda.vim",
	"MaximilianLloyd/ascii.nvim",
	"MunifTanjim/nui.nvim",
	"lewis6991/impatient.nvim",
	"ahmedkhalf/project.nvim",
	"mbbill/undotree",
	"karb94/neoscroll.nvim",
	"vifm/vifm.vim",
	{ "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },
	"p00f/cphelper.nvim",
	"jcdickinson/wpm.nvim",
	{
		"folke/zen-mode.nvim",
		opts = {
			plugins = {
				kitty = {
					enabled = true,
					font = "+4",
				},
			},
		},
	},

	-- Colorschemes
	"sainnhe/gruvbox-material",

	-- CMP stuff
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lsp",

	-- Snippets
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",

	-- LSP
	"neovim/nvim-lspconfig",
	{ "folke/neodev.nvim", opts = {} },
	"stevearc/conform.nvim",

	-- Telescope
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-media-files.nvim",

	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"p00f/nvim-ts-rainbow",
	"nvim-treesitter/playground",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"DaeZak/crafttweaker-vim-highlighting",
	"luckasRanarison/tree-sitter-hypr",
	"SpaceVim/vim-swig",

	-- Git
	"lewis6991/gitsigns.nvim",
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
})
