-- local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer") ]]
 if not status_ok then
	return
 end

 -- Register a handler that will be called for all installed servers.
 -- Alternatively, you may also register handlers on specific server instances instead (see example below).
 lsp_installer.on_server_ready(function(server)
	local opts = {
	on_attach = require("jc.lsp.handlers").on_attach,
		capabilities = require("jc.lsp.handlers").capabilities,
	}

	 if server.name == "jsonls" then
      local jsonls_opts = require("jc.lsp.settings.jsonls")
      opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	 end

	if server.name == "bashls" then
     local bashls_opts = require("jc.lsp.settings.bashls")
     opts = vim.tbl_deep_extend("force", bashls_opts, opts)
	end

	if server.name == "lua_ls" then
		local lua_ls_opts = require("jc.lsp.settings.lua_ls")
		opts = vim.tbl_deep_extend("force", lua_ls_opts, opts)
	end

	-- TODO: This needs a custom installer
	--	 if server.name == "terraform_lsp" then
	--	 	local terraform_lsp_opts = require("jc.lsp.settings.terraform_lsp")
	--	 	opts = vim.tbl_deep_extend("force", terraform_lsp_opts, opts)
	--	 end

	 if server.name == "tflint" then
      local tflint_opts = require("jc.lsp.settings.tflint")
      opts = vim.tbl_deep_extend("force", tflint_opts, opts)
	 end

	if server.name == "terraformls" then
		local terraformls_opts = require("jc.lsp.settings.terraformls")
		opts = vim.tbl_deep_extend("force", terraformls_opts, opts)
	end

	 if server.name == "dockerls" then
      local dockerls_opts = require("jc.lsp.settings.dockerls")
      opts = vim.tbl_deep_extend("force", dockerls_opts, opts)
	 end

	-- This setup() function is exactly the same as lspconfig's setup function.
 -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
 end)
