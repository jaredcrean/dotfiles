-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━❰ Load/Source Configs ❱━━━━━━━━━━━━━ --

-- plugin config to improve start-up time.
-- it should be always on top on init.lua file
--require('jc.impatient') -- impatient needs to be setup before any other lua plugin is loaded so it is recommended you add the following near the start of your
--require('jc.filetype_nvim') -- Easily speed up your neovim startup time!

require "jc.configs" -- plugin independent configs
require "jc.mappings" -- plugin independent mappings
require "jc.plugins"
require "jc.lsp" -- plugin independent mappings
require "jc.cmp" -- plugin independent mappings
require "jc.telescope"
require "jc.gitsigns"
require "jc.treesitter"
require "jc.which-key"
require "jc.nvim-tree"
require "jc.nvim-web-devicons"
require "jc.project"
