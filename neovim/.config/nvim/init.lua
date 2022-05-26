-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━❰ Load/Source Configs ❱━━━━━━━━━━━━━ --

-- plugin config to improve start-up time.
-- it should be always on top on init.lua file
require("jc.impatient") -- impatient needs to be setup before any other lua plugin is loaded so it is recommended you add the following near the start of your
require("jc.filetype") -- Easily speed up your neovim startup time!
require("jc.configs") -- plugin independent configs
require("jc.mappings") -- plugin independent mappings
require("jc.plugins")
require("jc.autocommands")
require("jc.nvim-web-devicons")
require("jc.lsp")
require("jc.lsp-colors")
require("jc.cmp")
require("jc.project")
require("jc.telescope")
-- require("jc.telescope-worktree")
require("jc.git-worktree")
require("jc.gitsigns")
require("jc.themes")
require("jc.lualine")
require("jc.treesitter")
require("jc.which-key")
require("jc.nvim-tree")
require("jc.autopairs")
require("jc.bufferline")
require("jc.alpha")
require("jc.glow")
require("jc.neorg")
require("jc.joplin")
-- require "jc.feline"
require("jc.comment")
require("jc.toggleterm")
require("jc.trouble")
require("jc.auto-session")
require("jc.session-lens")
