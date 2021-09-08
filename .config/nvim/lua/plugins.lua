-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  use {'dracula/vim', as = 'dracula'}

  use 'hoob3rt/lualine.nvim'

  use 'neovim/nvim-lspconfig'

  use { 'ms-jpq/coq_nvim', branch = 'coq'}
  
  use { 'ms-jpq/coq.artifacts', branch= 'artifacts'}

  use 'b3nj5m1n/kommentary'

  use 'jdhao/better-escape.vim'

  use 'ibhagwan/fzf-lua'

  use 'vijaymarupudi/nvim-fzf'

  use 'folke/which-key.nvim'

  use 'projekt0n/github-nvim-theme'

  use "steelsojka/pears.nvim"
  
  use 'glepnir/lspsaga.nvim'

  use 'onsails/lspkind-nvim'

  use 'RRethy/vim-illuminate'

  use 'p00f/nvim-ts-rainbow'

  use 'ggandor/lightspeed.nvim'

  use 'ray-x/lsp_signature.nvim'

end)
