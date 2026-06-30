" --- Vim-Plug Section ---
call plug#begin('~/.vim/plugged')

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File explorer
Plug 'preservim/nerdtree'

" Icons for NERDTree and others
Plug 'ryanoasis/vim-devicons'

" Colorscheme
Plug 'morhetz/gruvbox'

call plug#end()
" --- End Vim-Plug ---

" Basic settings
set number
set relativenumber
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a
set t_Co=256
set cursorline
set termguicolors

" Theme settings
" Using Gruvbox as it's very stable across different Vim versions
autocmd vimenter * colorscheme gruvbox
set background=dark

" Airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='gruvbox'
set laststatus=2

" NERDTree shortcut
nnoremap <C-n> :NERDTreeToggle<CR>

" Use JetBrainsMono Nerd Font in your terminal for icons!
