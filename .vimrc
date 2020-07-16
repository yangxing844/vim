call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'jiangmiao/auto-pairs'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'honza/vim-snippets'
""""""""""""""""""""""""""""
"  nerdtree configutation  "
""""""""""""""""""""""""""""
Plug 'scrooloose/nerdtree'
let g:NERDTreeShowHidden = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeColorMapCustom = {
    \ "Staged"    : "#0ee375",
    \ "Modified"  : "#d9bf91",
    \ "Renamed"   : "#51C9FC",
    \ "Untracked" : "#FCE77C",
    \ "Unmerged"  : "#FC51E6",
    \ "Dirty"     : "#FFBD61",
    \ "Clean"     : "#87939A",
    \ "Ignored"   : "#808080"
    \ }
"""""""""""""""""""""""
"  coc configutation  "
"""""""""""""""""""""""
Plug 'neoclide/coc.nvim', {'branch': 'release'}
inoremap <expr><CR>   pumvisible() ? "\<c-n>" : "\<CR>"
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
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
"-------------------------Misc---------------------------
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'tell-k/vim-autopep8',{'for':'python'}
Plug 'godlygeek/tabular',{'for':'markdown'}
Plug 'plasticboy/vim-markdown',{'for':'markdown'}
Plug 'Yggdroot/indentLine',{'for':['python','txt']}
Plug 'yianwillis/vimcdoc'
set foldmethod=indent
set foldlevel=99
Plug 'bling/vim-airline'
let g:airline_powerline_fonts = 1
Plug 'skywind3000/asyncrun.vim'
Plug 'KeitaNakamura/tex-conceal.vim',{'for':'tex'}
let g:tex_conceal="abdgm"
let g:tex_conceal_frac=1
set conceallevel=2
""""""""""""
"  vimtex  "
""""""""""""
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:livepreview_previewer = 'skim'
let g:vimtex_quickfix_mode = 0
let g:vimtex_quickfix_latexlog = {
          \ 'overfull' : 0,
          \ 'underfull' : 0,
          \ 'packages' : {
          \   'default' : 0,
          \ },
          \}
let g:vimtex_compiler_latexmk_engines = {
			\ '_'         : '-xelatex --shell-escape'
			\}
Plug '907th/vim-auto-save'
let g:auto_save = 1  " enable AutoSave on Vim startup
"""""""""""""""""""""""""""""
"  ultisnips configutation  "
"""""""""""""""""""""""""""""
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

call plug#end()
set rtp+=/usr/local/opt/fzf
set history=100
set undolevels=100
set title



"----------------------------编码问题------------------------------
set fileencodings=utf-8,gb2312,gbk,cp936,latin-1
set fileformat=unix
"-----------------------------apperance----------------------------
colorscheme dracula
set termguicolors
set mouse=vn
set showcmd
if !has('nvim')
set guifont=JetBrainsMonoNerdFontCompleteM-Medium:h18
endif
set nu
set ruler
let g:python_highlight_all = 1
"----------------------------performance--------------------------
syntax on
" -------------------------------改键-----------------------------
nmap <C-t> :NERDTreeToggleV<CR>
nnoremap <silent> <c-c> :%s/\s\+$//<CR>
map <F1> :call UltiSnips#RefreshSnippets() <CR>
map <F2> : browse oldfiles <CR>
map <C-r> : source~/Desktop/dotfiles/.vimrc <CR>
map <F8> : source~/.gvimrc<CR>
nnoremap U <C-r>
nnoremap <silent> <C-d> <C-b>
map Y y$
nnoremap gl $
nnoremap gh ^
vnoremap gl $
vnoremap gh ^
nnoremap <silent> `` :on<CR>
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <space> za
nnoremap <space>e :CocList extensions<CR>
nnoremap <silent> <C-h> <C-w><C-h>
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>
nnoremap <silent> <C-i> <C-d>
nnoremap <F5> :call CompileRunGcc()<CR>
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
set nocompatible
set backspace=indent,eol,start "任何时候都可以输入回车"
set backspace=2
set autoindent
set nobackup
set nowritebackup
set noswapfile


set tabstop=4
set softtabstop=4
set shiftwidth=4
set helplang=cn
set showmatch
set hlsearch
" 检测文件的类型
filetype on
filetype plugin on
filetype indent on
set cindent
set autowrite
set clipboard+=unnamed
set guioptions-=r
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
