" vim-plug plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'w0ng/vim-hybrid'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

" theme
colorscheme hybrid

" <leader>
let mapleader=','

cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

set number
" set relativenumber
set hlsearch

set nocompatible
filetype plugin on
runtime macros/matchit.vim

" patterns/visual-star.vim
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>/<C-R>=@<CR><CR>

function! s:VSetSearch(cmdtype)
	let temp = @s
	norm! gv"sy
	let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
	let @s = temp
endfunction

""" key mapping
" nerdTree 
nnoremap <leader>v :NERDTreeFind<cr>
nnoremap <leader>g :NERDTreeToggle<cr>

" use <esc> to remove search highlight
map <esc> :noh <CR>

" ctrlp mapping
let g:ctrlp_map = '<c-p>'
