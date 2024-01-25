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

	-- Easily speed up your neovim startup time!. A faster version of filetype.vim use("nathom/filetype.nvim")
	-- use("nathom/filetype.nvim")
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "jose-elias-alvarez/null-ls.nvim",
    "jay-babu/mason-null-ls.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim"
  }

	-- Make it easier to map keys
	use("b0o/mapx.nvim")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

  use({"mbbill/undotree"})

	use("p00f/nvim-ts-rainbow")

	-- easier commenting
  use { 'numToStr/Comment.nvim'}

	-- Better status line
	--  use 'feline-nvim/feline.nvim'
	use("nvim-lualine/lualine.nvim")

	-- Better buffers
	use("moll/vim-bbye")

	--  Start screens
	use("goolord/alpha-nvim")

	-- Terminal
	use({ "akinsho/toggleterm.nvim" })

	-- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/popup.nvim")

	-- LSP
	-- use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight

  -- Git plugins
	use("lewis6991/gitsigns.nvim")
	use("kdheepak/lazygit.nvim")

  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" } },
    config = function()
        require("telescope").load_extension("lazygit")
    end,
  })

	-- Terraform setup
	-- use("hashivim/vim-terraform")

	-- Trouble show's problems with code in file instead of quickfix menu
	use({
		"folke/trouble.nvim",
		requires = {"kyazdani42/nvim-web-devicons"},
	})

	-- Telescope
	-- use("nvim-telescope/telescope.nvim")
	use("cljoly/telescope-repo.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("ThePrimeagen/git-worktree.nvim")
  use("xiyaowong/telescope-emoji.nvim")

  use {
    "ahmedkhalf/project.nvim",
    -- requires = {"neovim/nvim-lspconfig"},
  }


  use("jvgrootveld/telescope-zoxide")

	-- Themes
  use("rktjmp/lush.nvim")
	use("folke/lsp-colors.nvim")
	use("marko-cerovac/material.nvim")
  use("lettertwo/laserwave.nvim")
  use("NLKNguyen/papercolor-theme")
 --  use("folke/tokyonight.nvim")
 --  use("rktjmp/lush.nvim")
  use{"luisiacc/gruvbox-baby", branch = 'main'}
  use({
	 "catppuccin/nvim",
   as = "catppuccin"
  })

  use ('ThePrimeagen/harpoon')
--  use('toppair/reach.nvim')
  use('chentoast/marks.nvim')

	-- CMP Plugins
  use ('neovim/nvim-lspconfig')
  use ('hrsh7th/cmp-nvim-lsp')
  use ('hrsh7th/cmp-buffer')
  use ('hrsh7th/cmp-path')
  use ('hrsh7th/cmp-cmdline')
  use ('hrsh7th/nvim-cmp')

	use("hrsh7th/cmp-bquffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions

	use("saadparwaiz1/cmp_luasnip") -- snippet completions

  --- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets")

  use {
  'doxnit/cmp-luasnip-choice',
  config = function()
    require('cmp_luasnip_choice').setup({
        auto_open = true, -- Automatically open nvim-cmp on choice node (default: true)
    });
  end,
  }

  --- Add config here. Example config:
  vim.g.tabby_keybinding_accept = '<Tab>'

  --- Tabby plugin
  use { 'TabbyML/vim-tabby' }

  -- Neotree

  use {
    "nvim-neo-tree/neo-tree.nvim",
       branch = "v2.x",
       requires = {
         "nvim-lua/plenary.nvim",
         "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
         "MunifTanjim/nui.nvim",
    }
  }

  -- Surround text
  use{
      "kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
--      config = require("/nvim-surround"),
    }

	-- Session Manager
  use {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
      }
    end
  }
  use("rmagatti/session-lens")

	use("windwp/nvim-autopairs")
  -- Markdown Colors
  use {"ellisonleao/glow.nvim", branch = 'main'}
	-- Buffers
  -- use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

	use("kazhala/close-buffers.nvim")

	-- better tmux config
	use("christoomey/vim-tmux-navigator")
  use("RyanMillerC/better-vim-tmux-resizer")

  -- Better Spell Checking
  use("vigoux/LanguageTool.nvim")

	use("kyazdani42/nvim-web-devicons")
	use("folke/which-key.nvim")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
