require("mason").setup {
    run = ":MasonUpdate", -- :MasonUpdate updates registry contents
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
}

local mls = require("mason-null-ls")
mls.setup({
      -- A list of sources to install if they're not already installed.
      -- This setting has no relation with the `automatic_installation` setting.
      ensure_installed = { "stylua", "lua-lsp", "jq-lsp", "shellcheck" },
    -- Run `require("null-ls").setup`.
    -- Will automatically install masons tools based on selected sources in `null-ls`.
    -- Can also be an exclusion list.
    -- Example: `automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }`
    automatic_installation = true,
      -- Whether sources that are installed in mason should be automatically set up in null-ls.
      -- Removes the need to set up null-ls manually.
      -- Can either be:
      --  - false: Null-ls is not automatically registered.
      --  - true: Null-ls is automatically registered.
      --  - { types = { SOURCE_NAME = {TYPES} } }. Allows overriding default configuration.
      --  Ex: { types = { eslint_d = {'formatting'} } }
        automatic_setup = true,
})

-- require("lspconfig").lua_ls.setup {}u
require('mason-tool-installer').setup {

  -- a list of all tools you want to ensure are installed upon
    -- start; they should be the names Mason uses for each tool
    ensure_installed = {

        -- you can pin a tool to a particular version
        { 'golangci-lint', version = 'v1.47.0' },

    -- you can turn off/on auto_update per tool
    { 'bash-language-server', auto_update = true },

    'lua-language-server',
    'vim-language-server',
    -- 'gopls',
    'stylua',
    'shellcheck',
    'editorconfig-checker',
    -- 'gofumpt',
    -- 'golines',
    -- 'gomodifytags',
    -- 'gotests',
    -- 'impl',
    'json-to-struct',
    'luacheck',
    'misspell',
    'revive',
    'shfmt',
    'staticcheck',
    -- 'vint',
    'terraform-ls',
  },

    -- if set to true this will check each tool for updates. If updates
    -- are available the tool will be updated. This setting does not
    -- affect :MasonToolsUpdate or :MasonToolsInstall.
    -- Default: false
    auto_update = false,

    -- automatically install / update on startup. If set to false nothing
    -- will happen on startup. You can use :MasonToolsInstall or
    -- :MasonToolsUpdate to install tools and check for updates.
    -- Default: true
    run_on_start = true,

    -- set a delay (in ms) before the installation starts. This is only
    -- effective if run_on_start is set to true.
    -- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
    -- Default: 0
    start_delay = 3000, -- 3 second delay

    -- Only attempt to install if 'debounce_hours' number of hours has
    -- elapsed since the last time Neovim was started. This stores a 
    -- timestamp in a file named stdpath('data')/mason-tool-installer-debounce.
    -- This is only relevant when you are using 'run_on_start'. It has no
    -- effect when running manually via ':MasonToolsInstall' etc....
    -- Default: nil
    debounce_hours = 5, -- at least 5 hours between attempts to install/update
}

-- require("mason-lspconfig").setup {
--     ensure_installed = { "lua_ls", "rust_analyzer",},
-- }
