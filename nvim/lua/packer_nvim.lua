--              NOTE:1
-- If you want to automatically ensure that packer.nvim is installed on any machine you clone your configuration to,
-- add the following snippet (which is due to @Iron-E) somewhere in your config before your first usage of packer:
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({
		'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path
	})
	execute 'packadd packer.nvim'
end

-- don't throw any error on first use by packer
local ok, packer = pcall(require, "packer")
if not ok then return end

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
)

-- Install your plugins here
return packer.startup {
    function(use)

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Improve Start-UP time
    use { -- Speed up loading Lua modules in Neovim to improve startup time.
         'lewis6991/impatient.nvim'
    }

    use { -- Easily speed up your neovim startup time!. A faster version of filetype.vim
      'nathom/filetype.nvim'
    }

   -- Make it easier to map keys
   use{'b0o/mapx.nvim'}

   use{"nvim-lua/popup.nvim"} -- An implementation of the Popup API from vim in Neovim

   use{
       'neovim/nvim-lspconfig',
       requires = {
         'williamboman/nvim-lsp-installer',
     },
       config = [[require('plugins.lspconfig')]],
   }

   use{'nvim-treesitter/nvim-treesitter',
   			requires = {
				'nvim-treesitter/playground', -- Treesitter playground integrated into Neovim
				opt = true
      },
       run = ':TSUpdate',
       config = [[require('plugins/nvim-treesitter')]],
   }

   use{'dracula/vim', as = 'dracula'}

--   use{
--     'lewis6991/gitsigns.nvim',
--     requires = {
--       'nvim-lua/plenary.nvim',
--     },
--    -- config = [[require('plugins.gitsigns_nvim')]],
--     config = function()
--       require('gitsigns').setup()
--     end
--   }

   use{
     'nvim-telescope/telescope.nvim',
     requires = { {'nvim-lua/plenary.nvim'} },
     config = [[require('plugins.telescope')]],
   }

   --use({'nvim-telescope/telescope-fzf-native.nvim',
   --     config = [[require(plugins.telescope-fzf-native']],
   --     run = 'make',
   --}

   --use 'SirVer/ultisnips'
   --use 'honza/vim-snippets'
   use{'hrsh7th/cmp-nvim-lsp'}
   use{'hrsh7th/cmp-buffer'}
   use{'hrsh7th/cmp-path'}
   use{'hrsh7th/cmp-cmdline'}
   use{
       'hrsh7th/nvim-cmp',
       config = [[require('plugins.cmp')]],
   }


   -- For vsnip users.
   use{'hrsh7th/cmp-vsnip'}
   use{
       'hrsh7th/vim-vsnip',
       config = [[require('plugins.vim-vsnip')]],
   }

   use{"rafamadriz/friendly-snippets"}

   use{
     'kyazdani42/nvim-web-devicons',
      config = [[require('plugins.nvim-web-devicons')]],
   }

   use {
     "folke/which-key.nvim",
     config = function()
       require("which-key").setup {
         -- your configuration comes here
         -- or leave it empty to use the default settings
         -- refer to the configuration section below
       }
     end
   }

   use {
       'kyazdani42/nvim-tree.lua',
       requires = {
         'kyazdani42/nvim-web-devicons', -- optional, for file icon
       },
       --config = function() require'plugins.nvim-tree'.setup {} end
       config = function() require'plugins.nvim-tree'.setup {} end
   }

   -- Automatically set up your configuration after cloning packer.nvim
   -- Put this at the end after all plugins
    end,

   	config = {
	    	-- Move to lua dir so impatient.nvim can cache it
	    	compile_path = vim.fn.stdpath('config') .. '/plugin/packer_compiled.lua',

	    	display = {
	    		open_fn = function()
	    		  	return require('packer.util').float({border = 'single'})
	    		end
    }
  }
}

