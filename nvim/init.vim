set number
set clipboard=unnamedplus
colorscheme vim
set termguicolors

call plug#begin('~/.local/share/nvim/plugged')

Plug 'norcalli/nvim-colorizer.lua'





call plug#end()
lua require'colorizer'.setup()

