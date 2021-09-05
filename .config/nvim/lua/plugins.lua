-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function() require('config.treesitter') end}

  use {'dracula/vim', as = 'dracula'}

  use 'hoob3rt/lualine.nvim'

  use 'neovim/nvim-lspconfig'

  use 'hrsh7th/nvim-cmp'

  use 'hrsh7th/vim-vsnip'

  use 'hrsh7th/vim-vsnip-integ'
  
  use 'rafamadriz/friendly-snippets'

  use 'hrsh7th/cmp-buffer'

  use 'hrsh7th/cmp-nvim-lsp'

  use 'winston0410/commented.nvim'

  use 'jdhao/better-escape.vim'

  use 'ibhagwan/fzf-lua'

  use 'vijaymarupudi/nvim-fzf'

  use 'folke/which-key.nvim'

  use 'projekt0n/github-nvim-theme'

  use 'windwp/nvim-autopairs'
  
  use 'windwp/nvim-ts-autotag'

  use {"ellisonleao/glow.nvim", run = "GlowInstall"}

  use 'glepnir/lspsaga.nvim'

  use 'onsails/lspkind-nvim'

  use 'RRethy/vim-illuminate'

  use 'p00f/nvim-ts-rainbow'

end)
