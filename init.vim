 "		       (_)                      
 "		__   __ _  _ __ ___   _ __  ___ 
 "		\ \ / /| || '_ ` _ \ | '__|/ __|
 "		_\ V / | || | | | | || |  | (__ 
 "     (_)\_/  |_||_| |_| |_||_|   \___]
"{{{1 Load plugins
call plug#begin('~/.vim/plugged')
" vim-sensible {{{ "
Plug 'tpope/vim-sensible'

" }}} vim-sensible "
" dracula {{{ "
Plug 'dracula/vim', { 'as': 'dracula' }

" }}} dracula "
" vim-snippets {{{ "
Plug 'honza/vim-snippets'

" }}} vim-snippets "
"{{{2   Coc Plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}
inoremap <expr> <C-j>   pumvisible() ? "\<c-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-python'
  \ ]
nmap <leader>rn <Plug>(coc-rename)
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
"explorer 
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }
"}}}2
" vim-devicons {{{ "
Plug 'ryanoasis/vim-devicons'

" }}} vim-devicons "
" vim-gitgutter {{{ "
Plug 'airblade/vim-gitgutter'

" }}} vim-gitgutter "
" vim-commentary {{{ "
Plug 'tpope/vim-commentary'

" }}} Fold description "
" vim-airline-thems {{{ "
Plug 'vim-airline/vim-airline-themes'

" }}} vim-airline "
" vim-polyglot {{{ "
Plug 'sheerun/vim-polyglot'

" }}} vim-polyglot "
" autopep8 {{{ "
Plug 'tell-k/vim-autopep8',{'for':'python'}

" }}} autopep8 "
" tabular {{{ "
Plug 'godlygeek/tabular',{'for':'markdown'}

" }}} tabular "
" vim-markdown {{{ "
Plug 'plasticboy/vim-markdown',{'for':'markdown'}

" }}} vim-markdown "
" vimdoc {{{ "
Plug 'yianwillis/vimcdoc'

" }}} vimdoc "
" vim-airline {{{ "
Plug 'bling/vim-airline'
let g:airline_powerline_fonts = 1
" }}} vim-airline "
" asyncrun {{{ "
Plug 'skywind3000/asyncrun.vim'

" }}} asyncrun "
" tex-conceal {{{ "
Plug 'KeitaNakamura/tex-conceal.vim',{'for':'tex'}
let g:tex_conceal="abdgm"
let g:tex_conceal_frac=1
set conceallevel=2

" }}} tex-conceal "
" vimtex {{{ "
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:livepreview_previewer = 'zathura'
let g:vimtex_quickfix_mode = 0
let g:vimtex_quickfix_latexlog = {
          \ 'overfull' : 0,
          \ 'underfull' : 0,
          \ 'packages' : {
          \ 'default' : 0,
          \ },
          \}
let g:vimtex_compiler_latexmk_engines = {
			\ '_'         : '-xelatex --shell-escape'
			\}

" }}} vimtex "
" auto-save {{{ "
Plug '907th/vim-auto-save'
let g:auto_save = 1  " enable AutoSave on Vim startup

" }}} auto-save "
" UltiSnips {{{ "
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" }}} UltiSnips "
" fzf {{{ "
Plug 'junegunn/fzf', {
      \ 'dir': '~/.fzf',
      \ 'do': './install --all --no-update-rc',
      \}
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
let g:fzf_layout = {'window': {'width': 0.9, 'height': 0.85} }
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'],
      \}

let g:fzf_mru_no_sort = 1
let g:fzf_mru_exclude = '\v' . join([
      \ '\.git/',
      \], '|')
" let g:fzf_mru_relative = 1
" let g:fzf_mru_include

let $FZF_DEFAULT_OPTS = '--reverse --inline-info'

function! s:nothing()
endfunction

augroup my_fzf_config
  autocmd!
  autocmd User FzfStatusLine call s:nothing()
  autocmd FileType fzf silent! tunmap <esc>
augroup END

command! -bang Zotero call fzf#run(fzf#wrap(
            \ 'zotero',
            \ { 'source':  'fd -t f -e pdf . ~/.local/zotero/',
            \   'sink':    'silent !zathura --fork',
            \   'options': '-m -d / --with-nth=-1' },
            \ <bang>0))

nnoremap <silent> <leader>oo       :call fzf#run(fzf#wrap({
      \ 'dir': FindRootDirectory(),
      \ 'options': [
      \   '-m',
      \   '--prompt', 'Files > '
      \ ],
      \}))<cr>
" }}} fzf "
call plug#end()
"}}}1

"{{{1 UI
let g:python_highlight_all = 1
colorscheme dracula
set termguicolors
set mouse=vn
set showcmd
if !has('nvim')
set guifont=JetBrainsMonoNerdFontCompleteM-Medium:h18
endif
set ruler
let g:python_highlight_all = 1
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
"}}}1

"{{{1 performance
syntax on
set cursorline
set undolevels=100
set title
set history=100
set updatetime=300
set timeoutlen=500
"}}}1 

"{{{1keymapping
"dealing with wrapped lines
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ gj

nnoremap  <c-e> :CocCommand explorer<CR>
nnoremap  <space>f :FZF<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
nnoremap <silent> <c-c> :%s/\s\+$//<CR>
map <F1> :call UltiSnips#RefreshSnippets() <CR>
map <F2> :browse oldfiles <CR>
nnoremap <silent><C-r> :source $MYVIMRC <CR>
nnoremap <silent>  <leader>em :edit $MYVIMRC <CR>
nnoremap U <C-r>
inoremap jk <Esc>
nnoremap <silent> <C-d> <C-b>
map Y y$
nnoremap gl $
nnoremap gh ^
vnoremap gl $
vnoremap gh ^
nnoremap <silent> `` :on<CR>
nnoremap <silent> <c-space> za
nnoremap <silent> <C-h> <C-w><C-h>
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>
nnoremap <silent> <C-i> <C-d>
nnoremap <silent> <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
          exec "w"
          if &filetype == 'python'
                  if search("@profile")
                          exec "AsyncRun kernprof -l -v %"
                          exec "copen"
                          exec "wincmd p"
                  elseif search("set_trace()")
                          exec "!python3 %"
                  else
                          exec "AsyncRun -mode=term -rows=10 -raw python3 %"
                          exec "wincmd p"
				  endif
          endif
endfunc
"}}}1

"{{{1 misc
set backspace=indent,eol,start "任何时候都可以输入回车"
set backspace=2
set autoindent
set nobackup
set nowritebackup
set noswapfile
set autochdir
set tabstop=4
set softtabstop=4
set shiftwidth=4
set helplang=cn
set showmatch
set hlsearch
filetype on
filetype plugin on
filetype indent on
set cindent
set autowrite
set clipboard+=unnamedplus
set guioptions-=r
set termguicolors
set mouse=vn
set showcmd
set ruler
set scrolloff=5
"}}}1

"{{{1 encoding
set fileencodings=utf-8,gb2312,gbk,cp936,latin-1
set fileformat=unix
set nocompatible
"}}}1C