require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["corea.keybinds"] = {},
        ["core.norg.concealer"] = {},
        ["core.norg.completion"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    work = "~/Documents/notes-neorg/work",
                    personal = "~/Documents/notes-neorg/personal",
                }
            }
        }
    }
}
