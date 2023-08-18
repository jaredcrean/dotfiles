-- plugin config to improve start-up time.
-- it should be always on top on init.lua file
require("jc.plugins")

require("jc.configs") -- plugin independent configs

require("jc.nvim-web-devicons")

require("jc.mason")
-- require("jc.mason-null-ls")
-- require("jc.mason-tool-installer")
-- require("jc.lsp-colors")
-- require("jc.lsp")

require("jc.autocommands")
require("jc.nvim-cmp")
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
-- require("jc.tabby")

require("jc.mappings.mappings") -- plugin independent mappings
