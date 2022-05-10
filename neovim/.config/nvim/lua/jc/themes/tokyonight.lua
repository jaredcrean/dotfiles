vim.g.tokyonight_style = "storm"
tokyonight_dark_sidebar = true
vim.g.tokyonight_italic_functions = true

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]
