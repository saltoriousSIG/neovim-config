local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitte
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  --colorschemes  
  use { "catppuccin/nvim", as = "catppuccin" }
  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/cmp-nvim-lsp" -- more cmp tools
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "neoclide/coc-tsserver"

  use {'fatih/vim-go', run = ':GoUpdateBinaries'}

  --undotree

  use "mbbill/undotree"

  --nerdtree
  use "preservim/nerdtree"

  --vim rooter using to have telescope search through the correct directiories
  use "airblade/vim-rooter" 

  --coc
  use {'neoclide/coc.nvim', branch = 'release'}
  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use


  -- LSP
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  --solidity
  use "tomlion/vim-solidity"

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
  -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'nvim-telescope/telescope-media-files.nvim'

  use 'darrikonn/vim-gofmt'

  --fugitive
  use 'tpope/vim-fugitive'

  --harpoon
  use "ThePrimeagen/harpoon" 

  --treesitter
  use({
		"nvim-treesitter/nvim-treesitter"
	})
  use "p00f/nvim-ts-rainbow"

  --Prettier
  use "prettier/vim-prettier"

  use({ "JoosepAlviste/nvim-ts-context-commentstring" })
  use({ "lewis6991/gitsigns.nvim"})

  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

