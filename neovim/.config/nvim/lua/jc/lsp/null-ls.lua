local nls = require("null-ls")
local U = require("jc.lsp.utils")

local fmt = nls.builtins.formatting
local dgn = nls.builtins.diagnostics

nls.setup({
	sources = {
		-- # FORMATTING #
		fmt.trim_whitespace.with({
			filetypes = { "text", "sh", "zsh", "toml", "make", "conf", "tmux", "terraform" },
		}),

		fmt.prettierd,
		fmt.eslint_d,
		-- fmt.prettier.with({
		--     extra_args = {
		--         '--tab-width=4',
		--         '--trailing-comma=es5',
		--         '--end-of-line=lf',
		--         '--arrow-parens=always',
		--     },
		-- }),
		fmt.rustfmt,
		fmt.stylua,
		fmt.terraform_fmt.with({
			filetypes = { "terraform", "tf" },
		}),
		fmt.gofmt,
		fmt.zigfmt,
		-- fmt.shfmt,
		-- # DIAGNOSTICS #
		dgn.eslint_d,
		dgn.shellcheck,
		dgn.luacheck.with({
			extra_args = { "--globals", "vim", "--std", "luajit" },
		}),

		fmt.stylua,
		fmt.shfmt.with({
			filetype = { "sh", "zsh" },
		}),

		fmt.prettier.with({
			filetypes = { "json", "yaml", "markdown" },
		}),

		fmt.isort,
		fmt.black,
		nls.builtins.diagnostics.shellcheck.with({
			diagnostics_format = "#{m} [#{c}]",
		}),
		nls.builtins.code_actions.gitsigns,
	},

	on_attach = function(client, bufnr)
		U.fmt_on_save(client)
		--U.mappings(bufnr)
	end,
})
