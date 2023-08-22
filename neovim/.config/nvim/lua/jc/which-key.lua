local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	["a"] = { "<cmd>Alpha<cr>", "Alpha" },
	["b"] = { "<cmd>Telescope buffers<cr>", "Buffers", },
  ["d"] = { "<cmd>!date \"+DATE: %y/%m/%d%nTIME: %Hyy:%M:%S\"<CR>" },
	["e"] = { "<cmd>Neotree show toggle<cr>", "File Explorer" },
	["w"] = { "<cmd>w!<CR>", "Save" },
	["q"] = { "<cmd>q!<CR>", "Quit" },
	["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
	["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
	["E"] = { "<cmd>Telescope emoji<CR>", "Emoji Search" },
  ["u"] = { "<cmd>UndotreeToggle<CR>", "Undo Tree" },
  ["j"] = { "<cmd>Telescope jumplist<cr>", "Jump List" },
	["p"] = { "<cmd>lua require'telescope'.extensions.projects.projects{}<cr>", "Projects" },

   m = {
       name = "Marks",
-- --	    m = { "<cmd>ReachOpen marks<cr>", "Marks" },
	     m = { "<cmd>Telescope harpoon marks<cr>", "Marks" },
	     -- m = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "View Marks" },
	     a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add Harpoon Marks" },
   },
  n = {
    n = { "<cmd>tabNext", "Next Tab" },
    t = { "<cmd>tabnew", "Create New Tab" },
  },

	P = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},
	f = {
		name = "Find",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		--f = {
		--	"<cmd>lua require("telescope.builtin").find_files{hidden = true}(require('telescope.themes').get_dropdown{previewer = true})<cr>",
		--	"Find files",
		--},

		f = {
			"<cmd>lua require('telescope.builtin').find_files({hidden=true, no_ignore=true, layout_config={prompt_position='bottom'}})<cr>",
			"Find files",
		},

    -- Search git repos for charter
		-- w = {
		--       "<cmd>lua require('telescope.builtin').find_files({hidden=true, cwd='~/gitrepos', layout_config={prompt_position='bottom'}})<cr>",
		-- 	"Search Work Git Repos",
		-- },


		w = {
      "<cmd>lua require'telescope'.extensions.repo.list{file_ignore_patterns={'/%.cache/', '/%.cargo/'}}<cr>",
			"Search Git Repos",
		},

		t = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
		s = { "<cmd>Telescope grep_string theme=ivy<cr>", "Cursor Find String in CWD" },
		h = { "<cmd>Telescope help_tags<cr>", "Help" },
		i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
		l = { "<cmd>Telescope resume<cr>", "Last Search" },
		r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		C = { "<cmd>Telescope commands<cr>", "Commands" },
	},

	g = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		l = { "<cmd>lua require('telescope').extensions.lazygit.lazygit()<CR>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		-- l = { "<cmd>GitBlameToggle<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
		w = {
			name = "Git Worktrees",
			w = {
				"<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
				"Switch and Delete a Worktree",
			},
			n = {
				"<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
				"Create New Worktree",
			},
		},

		G = {
			name = "Gist",
			a = { "<cmd>Gist -b -a<cr>", "Create Anon" },
			d = { "<cmd>Gist -d<cr>", "Delete" },
			f = { "<cmd>Gist -f<cr>", "Fork" },
			g = { "<cmd>Gist -b<cr>", "Create" },
			l = { "<cmd>Gist -l<cr>", "List" },
			p = { "<cmd>Gist -b -p<cr>", "Create Private" },
		},
	},

	l = {
		name = "LSP",
		d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
		D = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
		s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
		I = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto Implementation" },
		t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" },
		T = { "<cmd>TroubleToggle<CR>", "Goto Type Definition" },
		a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
		l = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
		i = { "<cmd>LspInfo<CR>", "Lsp Info" },
	},
	s = {
		name = "Search",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		d = { "<cmd>Telescope zoxide list<cr>", "CDIR with Z" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		--s = { "<cmd>SearchSession<cr>", "Search session's" },
		s = { "<cmd>Telescope session-lens search_session<cr>", "Search session's" },
--		s = { "<cmd>Telescope<cr>", "Home GitRepo's" },
	},

	t = {
		name = "Terminal",
		n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
		u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
		t = { "<cmd>lua _BTOP_TOGGLE()<cr>", "b-Top" },
		p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
