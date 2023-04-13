-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━❰ Load/Source Configs ❱━━━━━━━━━━━━━ --

-- plugin config to improve start-up time.
-- it should be always on top on init.lua file
require("jc.plugins")
-- require("jc.impatient") -- impatient needs to be setup before any other lua plugin is loaded so it is recommended you add the following near the start of your
--require("jc.filetype") -- Easily speed up your neovim startup time!
require("jc.configs") -- plugin independent configs
require("jc.mappings.mappings") -- plugin independent mappings
require("jc.lsp")
require("jc.mason")
require("jc.mason-tool-installer")
require("jc.mason-null-ls")
require("jc.autocommands")
require("jc.nvim-web-devicons")
require("jc.lsp-colors")
require("jc.cmp")
require("jc.project")
require("jc.telescope")
----require("jc.reach")
---- require("jc.telescope-worktree")
--require("jc.git-worktree")
require("jc.gitsigns")
require("jc.themes")
require("jc.lualine")
require("jc.treesitter")
require("jc.which-key")
----require("jc.nvim-tree")
require("jc.neotree")
require("jc.autopairs")
require("jc.close-buffers")
--require("jc.bufferline")
require("jc.auto-session")
require("jc.session-lens")
require("jc.alpha")
require("jc.luaSnip")
require("jc.snippets-settings")

require("jc.glow")
require("jc.comment")
require("jc.toggleterm")
--require("jc.trouble")
require("jc.marks")
require("jc.lazygit")
