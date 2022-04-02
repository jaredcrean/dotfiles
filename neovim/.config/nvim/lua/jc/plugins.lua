local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
  ]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here

	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Improve Start-UP time
	-- Speed up loading Lua modules in Neovim to improve startup time.
	use({ -- Speed up loading Lua modules in Neovim to improve startup time.
		"lewis6991/impatient.nvim",
	})

	-- Easily speed up your neovim startup time!. A faster version of filetype.vim
	use("nathom/filetype.nvim")
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

	-- Make it easier to map keys
	use("b0o/mapx.nvim")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use("p00f/nvim-ts-rainbow")

	-- easier commenting
	use("terrortylor/nvim-comment")

	-- Better status line
	--  use 'feline-nvim/feline.nvim'
	use("nvim-lualine/lualine.nvim")
	-- Better buffers
	use("moll/vim-bbye")

	--  Start screens
	use("goolord/alpha-nvim")
	--  use "mhinz/vim-startify"

	-- Terminal
	use({ "akinsho/toggleterm.nvim" })

	-- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/popup.nvim")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
	use("williamboman/nvim-lsp-installer")

	use("lewis6991/gitsigns.nvim")
	use("kdheepak/lazygit.nvim")
	-- Terraform setup
	use("hashivim/vim-terraform")

	-- Trouble show's problems with code in file instead of quickfix menu
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("cljoly/telescope-repo.nvim")

	use("ahmedkhalf/project.nvim")

	-- Themes
	--  use "lunarvim/darkplus.nvim"
	use("folke/lsp-colors.nvim")
	use("marko-cerovac/material.nvim")

	-- CMP Plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")

	-- Session Manager
	use("rmagatti/auto-session")
	use("rmagatti/session-lens")

	use("windwp/nvim-autopairs")

	-- Buffers
	use("akinsho/bufferline.nvim")
	use("kazhala/close-buffers.nvim")

	-- better tmux config
	use("christoomey/vim-tmux-navigator")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets")

	use("kyazdani42/nvim-web-devicons")
	use("folke/which-key.nvim")
	use("kyazdani42/nvim-tree.lua")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
