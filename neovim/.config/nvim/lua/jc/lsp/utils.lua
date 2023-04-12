local U = {}

---Common format-on-save for lsp servers that implements formatting
---@param client table
function U.fmt_on_save(client)
	if client.server_capabilities.document_formatting then
		vim.cmd([[
            augroup FORMATTING
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
        ]])
	end
end

---Make luajit runtime files discoverable to the server
function U.get_luajit_path()
	local luajit_path = vim.split(package.path, ";")
	table.insert(luajit_path, "lua/?.lua")
	table.insert(luajit_path, "lua/?/init.lua")
	return luajit_path
end

---Make neovim runtime files discoverable to the server
--function U.get_nvim_rtp_path()
--	return { os.getenv("VIMRUNTIME") }
--	  local result = {}
--	  for _, path in pairs(A.nvim_get_runtime_file('lua/', true)) do
--	      -- Don't load the `packer.nvim` path
--	      -- WARN: This is causing my local plugins to conflict with plugins loaded via packer.
--	      if not path:find('%.local/share') then
--	          result[path] = true
--	      end
--	  end
--	  return result
--end

return U
