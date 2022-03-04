-- ───────────────────────────────────────────────── --
-- ────────────────❰ Leader Mapping ❱─────────────── --
-- mapping leader here. it will work for every mapped

vim.g.mapleader = ','
vim.g.maplocalleader = '|'

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━❰ Load/Source Configs ❱━━━━━━━━━━━━━ --

-- plugin config to improve start-up time.
-- it should be always on top on init.lua file
require('plugins/impatient_nvim') -- impatient needs to be setup before any other lua plugin is loaded so it is recommended you add the following near the start of your
require('plugins/filetype_nvim') -- Easily speed up your neovim startup time!

require('configs') -- plugin independent configs
require('mappings') -- plugin independent mappings

--vim.cmd([[ au BufEnter *.*  lua require('langs') ]]) -- programmng language based configs

--require('customs/override_defalut') -- always put this config(override_defalut) at last because it's use to overide the any already defined config
--require('customs/project_env') -- load/source ".__nvim__" configs that are defined in working environment/project


-- load/source PLUGINS CONFIGS
-- loading plugins and its configs are managed in seperate config file
-- ~/.config/nvim/lua/plugins/packer_nvim.lua
-- NOTE: laways load plugins at last

require('packer_nvim')