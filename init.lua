require "sigi.options"
require "sigi.keymaps"
require "sigi.plugins"
require "sigi.colorscheme"
require "sigi.cmp" 
require "sigi.telescope" 
require "sigi.treesitter" 
require "sigi.autopairs"
require "sigi.gitsigns"
require "sigi.comment"
require "sigi.harpoon"

vim.cmd("source ~/.config/nvim/coc.vim")
-- Set gofmt command to goimports
vim.g.go_fmt_command = 'goimports'
-- Enable auto-format on save
vim.g.go_fmt_autosave = 1
