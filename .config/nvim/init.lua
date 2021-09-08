-- Load plugins for lua/plugins.lua
require('plugins')

-- Enable Lualine
require('lualine').setup{
	options = {
		theme = 'github'
	}
}

-- Treesitter config
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended = true,
  },
}

require('github-theme').setup({
	hideInactiveStatusline = true,
	themeStyle = 'dimmed',
})

vim.cmd("set termguicolors")
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.cmd("let g:better_escape_shortcut = 'fd'")
vim.cmd("set clipboard+=unnamedplus")
vim.cmd("set number")

vim.cmd("nnoremap <leader>ff <cmd>lua require('fzf-lua').files()<CR>")
vim.cmd("nnoremap <leader>bb <cmd>lua require('fzf-lua').buffers()<CR>")
vim.cmd("nnoremap <leader>fl <cmd>lua require('fzf-lua').builtin()<CR>")
vim.cmd("nnoremap <leader>bd <cmd>bd<CR>")
vim.cmd("nnoremap <leader>fs <cmd>w<CR>")

require('kommentary.config').use_extended_mappings()
require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
})
require("which-key").setup()

-- LSP Config

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  require 'illuminate'.on_attach(client)
  require 'lsp_signature'.on_attach()
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

vim.cmd("let g:coq_settings = { 'auto_start': 'shut-up' }")
local coq = require("coq")
require'lspconfig'.pyright.setup{coq.lsp_ensure_capabilities()}

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

local saga = require 'lspsaga'
saga.init_lsp_saga()

vim.cmd("nnoremap <silent><leader>clf :Lspsaga lsp_finder<CR>")
vim.cmd("nnoremap <silent><leader>cca :Lspsaga code_action<CR>")
vim.cmd("vnoremap <silent><leader>cca :<C-U>Lspsaga range_code_action<CR>")
vim.cmd("nnoremap <silent><leader>chd :Lspsaga hover_doc<CR>")
vim.cmd("nnoremap <silent><C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
vim.cmd("nnoremap <silent><C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")
vim.cmd("nnoremap <silent><leader>csh :Lspsaga signature_help<CR>")
vim.cmd("nnoremap <silent><leader>crn :Lspsaga rename<CR>")
vim.cmd("nnoremap <silent><leader>cpd:Lspsaga preview_definition<CR>")
vim.cmd("nnoremap <silent> <leader>cld :Lspsaga show_line_diagnostics<CR>")
vim.cmd("nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>")
vim.cmd("nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>")
vim.cmd("nnoremap <silent> <leader>cot :Lspsaga open_floaterm<CR>")
vim.cmd("tnoremap <silent> <leader>cct <C-\\><C-n>:Lspsaga close_floaterm<CR>")

require('lspkind').init()

require "pears".setup(function(conf)
	conf.preset "tag_matching"
end)

