syntax on
set nocompatible
set number
set t_Co=256
set background=dark
set incsearch
set mousehide
set mouse=a
set termguicolors
set updatetime=250

" Editor text
set tabstop=2
set shiftwidth=2
set autoindent
set copyindent
set hlsearch
set backspace=indent,eol,start

" No Swp files
set noswapfile
set nobackup
set nowritebackup

" PLUGINS
call plug#begin("~/.vim/plugged")
Plug 'jparise/vim-graphql'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install -all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'tpope/vim-commentary'
Plug 'tomlion/vim-solidity'
Plug 'lervag/vimtex'
call plug#end()

" COC config
let g:coc_global_extensions = [
\ 'coc-pairs',
\ 'coc-tsserver',
\ 'coc-eslint',
\ 'coc-prettier',
\ 'coc-json',
\ 'coc-rust-analyzer'
\ ]

" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to trigger completion.
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
" Run prettier on save
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Colorscheme
" let g:gruvbox_contrast_dark = "hard"
" let g:gruvbox_invert_signs = 0
" let g:gruvbox_invert_selection = 0
" let g:gitgutter_override_sign_column_highlight = 1
filetype indent plugin on
-
" ack.vim
if executable("ag")
	let g:ackprg = "ag --vimgrep"
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
" Run ack fast
nnoremap <leader>A :Ack "\b<cword>\b"<CR>

" junegunn/fzf
let $FZF_DEFAULT_COMMAND = "ag -g \"\""
nnoremap <C-P> :Files<CR>
inoremap <C-P> <ESC>:Files<CR>i

" Netrw
let g:netrw_fastbrowse = 0
let g:netrw_liststyle=3
nnoremap <C-e> :Lexplore<CR>
autocmd FileType netrw setl bufhidden=wipe

" Rust
let g:rustfmt_autosave = 1

" Zathura
let g:vimtex_view_method = 'zathura'
