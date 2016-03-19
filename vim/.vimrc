set nocompatible 

" ----------------------
" VIM behavor stuff
" ----------------------
set nobackup            
set nowritebackup
set encoding=utf8
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set writebackup
set tabstop=8 expandtab shiftwidth=4 softtabstop=4
set number

set guioptions-=m "menu
set guioptions-=T "toolbar
set encoding=utf-8

set backspace=indent,eol,start " make backspaces more powerfull

set autoindent
set smartindent
set showmatch

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
set textwidth=120       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line

" ----------------------
" UI
" ----------------------
let g:zenburn_high_Contrast=1 " color zenburn and consolas
colo zenburn
let python_highlight_all = 1
syntax on
filetype plugin indent on
set t_Co=256
set guifont=Luculent\ 10

"set rtp+=/home/flatline/.powerline/powerline/bindings/vim
set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

" ------------------------
"  Remaps
" ------------------------

" copy paste (windows habbits)
" CTRL-X and SHIFT-Del are Cut
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>       "+gP
map <S-Insert>          "+gP
cmap <C-V>      <C-R>+
cmap <S-Insert>         <C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
imap <S-Insert>         <C-V>
vmap <S-Insert>         <C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>           <C-V>
nnoremap <C-T> :CommandT<CR>

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=1
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

set tw=0

nnoremap <C-X><C-X> :qall!<CR>

" ------------------------
"  Syntastic config
" ------------------------

let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_balloons = 1
let g:syntastic_loc_list_height = 5

nnoremap <C-E> :Errors<CR>

" -------------------------
"  YCM config
" -------------------------

nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
let g:ycm_extra_conf_globlist = ['~/dev/*','!~/*']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_invoke_completion = '<C-Space>'

" ---------------------------
"  Nerdtree config
" ---------------------------
nnoremap <F2> :NERDTreeToggle . <CR>
let NERDTreeQuitOnOpen = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | qall | endif

" ---------------------------
"  Bundles
" ---------------------------

filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
"Bundle 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'

Plugin 'othree/xml.vim'
Plugin 'kchmck/vim-coffee-script'

Plugin 'mhinz/vim-tmuxify'

Plugin 'L9'
Plugin 'benmills/vimux'

Plugin 'chase/vim-ansible-yaml'
Plugin 'avakhov/vim-yaml'
Plugin 'tpope/vim-fugitive'
Plugin 'Shougo/vimshell.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'Hackerpilot/DCD', {'rtp': 'editors/vim'}

Plugin 'rizzatti/dash.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'fatih/vim-go'

call vundle#end()            " required
filetype plugin indent on    " required

" ----------------------------------------
" CtrlP config
" ----------------------------------------
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$\|\.dub$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }


" -------------------------------------------
"  Configuration for syntastic
" -------------------------------------------
filetype plugin indent on

let s:dub_includes = split(system('find ~/.dub/packages | ' .
                                \ 'grep "packages/[^/]*\(/source\)\?$" | ' .
                                \ 'grep -v "\(tests\?\|examples\?\|bin\)$"'))
let s:fdub_includes = []

func! IsSourced(m)
      return (match(a:m, '/source') != -1)
  endfunc

for m in s:dub_includes
    if (IsSourced(m))
        call add(s:fdub_includes, m)
    endif

    let s:is_there = 0
    for n in s:dub_includes
        if (match(n, m) == 0 && IsSourced(n))
            let s:is_there = 1
        endif
    endfor

    if (s:is_there == 0)
        call add(s:fdub_includes, m)
    endif
endfor

let g:syntastic_d_include_dirs = add(s:fdub_includes, './source')

"
" DCD config
" ------------------------------------

set omnifunc=syntaxComplete#complete
let g:dcd_path='/home/oglu/local/DCD'
let g:dcd_importPath=['/usr/include/d','/usr/include/d/druntime/import', '~/.dub', '.']
