syntax on
set nocompatible
set number
set t_Co=256
set background=dark
set incsearch
set relativenumber
set mousehide
set mouse=a

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
Plug 'airblade/vim-gitgutter'
Plug 'chemzqm/vim-jsx-improve'
Plug 'hail2u/vim-css3-syntax'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install -all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'leafgarland/typescript-vim'
Plug 'jparise/vim-graphql'
Plug 'mileszs/ack.vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'rust-lang/rust.vim'
Plug 'morhetz/gruvbox'
call plug#end()

" Gruvbox
let g:gruvbox_contrast_dark = "hard"
let g:gitgutter_override_sign_column_highlight = 1
colorscheme gruvbox

filetype indent plugin on

" ack.vim
if executable("ag")
	let g:ackprg = "ag --vimgrep"
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
" Run ack fast
nnoremap <leader>A :Ack "\b<cword>\b"<CR>

" vim-gitgutter
" let g:gruvbox_invert_signs = 1
set updatetime=250 "updates gutter more frequently

" junegunn/fzf
let $FZF_DEFAULT_COMMAND= "ag -g \"\""
nnoremap <C-P> :Files<CR>
inoremap <C-P> <ESC>:Files<CR>i

" Netrw
let g:netrw_fastbrowse = 0
let g:netrw_liststyle=3
nnoremap <C-e> :Lexplore<CR>
autocmd FileType netrw setl bufhidden=wipe

" Asynchronous Lint Engine (ALE)
" Limit linters used for JavaScript.
let g:ale_linters = { "javascript": ["eslint"], "typescript": ["eslint"] }
let g:ale_fixers = { "javascript": ["eslint"], "typescript": ["eslint", "prettier"] }
" highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
" highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = "%s [%linter%]"
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>
" run fixers on save
let g:ale_fix_on_save = 1
" respect prettier configs
let g:ale_javascript_prettier_use_local_config = 1

" Coc.vim
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Rust
let g:rustfmt_autosave = 1
