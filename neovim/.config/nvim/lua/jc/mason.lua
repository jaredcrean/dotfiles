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

require("mason-null-ls").setup({
    automatic_setup = true,
})
