"      ,.-~*´¨¯¨`*·~-.¸-(joe mama)-,.-~*´¨¯¨`*·~-.¸
"
" ==================-+-+-+-+-+-+-+-+-+-+==================
"   ++++++\ /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\//++++++
"          \_______ .  .  .  .  .  .  ._______/
"                 \_______ oooo _______/
"                    |    \||||/    |
"                    |    [++++]    |
"                   }:{    |><|    }:{
"                        (((II)))
"                          /::\
"                          \::/
"                           ||
"                      (((((oo)))))
"                           !!
"                           YY
"                           /\
"                          /><\
"               !----------|UU|----------!
"               |__________\  /__________|
"                           ++

"vnoremap <C-c> "+y
set clipboard+=unnamedplus
autocmd FileType markdown setlocal spell
"set mouse=a
set spelllang=it,en
set shell=/usr/bin/fish
set nu rnu
set noru
set nosmd   " short for 'showmode'
set laststatus=0
set noshowcmd
set signcolumn=yes
set cmdheight=1
set shortmess+=aoOWFc
set splitbelow splitright
set fillchars+=vert:\ 
set hidden
let s:hidden_all = 1

"Vundle Plugins
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

filetype plugin indent on    " required
filetype indent on

Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
"Plugin 'vim-pandoc/vim-rmarkdown'
"Plugin 'vim-syntastic/syntastic'
Plugin 'justmao945/vim-clang'
"Plugin 'aperezdc/vim-template'

call vundle#end()            " required

"Plug Plugins
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'tpope/vim-eunuch'
"Plug 'tpope/vim-speeddating'
"Plug 'tpope/vim-repeat'
"Plug 'ervandew/supertab'
Plug 'farmergreg/vim-lastplace'
"Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
"Plug 'rakr/vim-one'
"Plug 'mcchrish/nnn.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'SidOfc/mkdx'
Plug 'miyakogi/conoline.vim'
Plug 'mhinz/vim-startify'
"Plug 'tpope/vim-sensible'
"Plug 'tpope/vim-surround'
Plug 'jackguo380/vim-lsp-cxx-highlight'
"Plug 'terryma/vim-multiple-cursors'
Plug 'voldikss/vim-floaterm'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/goyo.vim'
"Plug 'Lenovsky/nuake'
"Plug 'mhartington/oceanic-next'
Plug 'ryanoasis/vim-devicons'
Plug 'lilydjwg/colorizer'
Plug 'tpope/vim-unimpaired'
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-clang-format'

call plug#end()

autocmd FileType json syntax match Comment +\/\/.\+$+

autocmd FileType * :silent CocDisable
autocmd FileType cpp,c,py :silent CocEnable

"let g:syntastic_cpp_checkers = ['clang_tidy']

let g:vim_markdown_no_extensions_in_markdown = 1

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#enabled = 0

let g:colorizer_maxlines = 1000


"let g:nnn#layout = 'vnew'
"let g:nnn#layout = { 'left': '~35%' } " or right, up, down

let g:mkdp_open_to_the_world = 1
let g:mkdp_port = '8000'
let g:mkdp_browser = 'kdeconnect-handler'
let g:mkdp_echo_preview_url = 1
set updatetime=100

let g:mkdx#settings = {
    \'highlight': { 'enable': 1 },
    \ 'enter': { 'shift': 1 },
    \ 'links': { 'external': { 'enable': 1 } },
    \ 'toc': { 'text': 'Table of Contents', 'update_on_write': 1 },
    \ 'fold': { 'enable': 1 } 
    \}

let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }

let g:conoline_color_normal_dark = 'guibg=NONE guifg=NONE'
let g:conoline_color_insert_dark = 'guibg=NONE guifg=NONE'
let g:conoline_color_normal_nr_dark = 'guibg=NONE guifg=#e5c07b'
let g:conoline_color_insert_nr_dark = 'guibg=NONE guifg=#e5c07b'

let g:startify_bookmarks = [ {'V': '~/.vimrc'}, {'D': '~/Dreams-3.0.md'}, {'F': '~/.config/fish/config.fish'}, {'T': '~/.tmux.conf'}, {'K': '~/.config/kitty/kitty.conf'} ]
let g:startify_files_number = 10
let g:startify_fortune_use_unicode = 1
let g:startify_padding_left = 5

let g:startify_custom_header = startify#pad(startify#fortune#boxed())

"Color Scheme

let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1

"colorscheme gunmetal-grey "OceanicNext/gruvbox/onedark1

"colorscheme tempus_dusk

"let g:airline_theme='onedark' "onedark/gruvbox/hybrid/minimalist/raven/base16_oceanicnext

let g:airline_theme='minimalist' 

" markdown preview settings

let g:mkdp_command_for_global = 1
let g:mkdp_auto_close = 0
let g:mkdp_markdown_css = '/home/antonino/Build-Folder/Unused-Stuff/M5.css'

" key binds

nnoremap <silent> <F2> :set nu! rnu!<CR>
nnoremap <silent> <F3> :set foldcolumn=0<CR>
nnoremap <silent> <C-l> :nohl<CR><C-l>

nmap <silent> <C-c> <Plug>(coc-cursors-position)
nmap <silent> <C-d> <Plug>(coc-cursors-word)

filetype plugin on
set nocompatible
set wildmode=longest,full
syntax on
set path+=**
set wildmenu

set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =8         " >> indents by 8 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.
set backspace   =indent,eol,start  " Make backspace work as you would expect.
set ttyfast                " Faster redrawing.
"set lazyredraw             " Only redraw when necessary.
set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.
set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol =200       " Only highlight the first 200 columns.
"set numberwidth=1

"highlight Folded ctermbg=NONE
"highlight FoldColumn ctermbg=NONE
"highlight NonText guifg=bg
"highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

tnoremap <Esc> <C-\><C-n>

" The fish shell is not very compatible to other shells and unexpectedly breaks things that use 'shell'.
"if &shell =~# 'fish$'
"  set shell=/bin/bash
"endif

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

" Auto-compile R Markdown and other shortcuts

autocmd BufWritePost *.Rmd silent :RMarkdown pdf 

autocmd FileType markdown nnoremap <silent> <F5> :MarkdownPreview<CR>
autocmd FileType markdown nnoremap <silent> <F7> :execute 'silent !pandoc % -o %:r.pdf'<CR>
autocmd FileType markdown nnoremap <silent> <F6> :execute 'silent !pandoc -t html5 --css /home/antonino/Build-Folder/Unused-Stuff/M5.css % -o %:r.pdf --mathml'<CR>
autocmd FileType markdown nnoremap <silent> <F11> :execute 'silent !zathura %:r.pdf &'<CR> :redraw!<CR>
autocmd FileType markdown nnoremap <silent> <F9> :Goyo<CR>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.

"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"

"function! InsertTabWrapper()
"    let col = col('.') - 1
"    if !col || getline('.')[col - 1] !~ '\k'
"        return "\<tab>"
"    else
"        return "\<c-p>"
"    endif
"endfunction
"inoremap <expr> <tab> InsertTabWrapper()
"inoremap <s-tab> <c-n>

"
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
inoremap <C-w> <C-\><C-o>dB
inoremap <C-BS> <C-\><C-o>db



function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
let g:coc_node_path = '/usr/local/lib/nodejs/node-v12.18.1-linux-x64/bin/node'

function AddTemplate(tmpl_file)
    exe "0read " . a:tmpl_file
    let substDict = {}
    let substDict["filename"] = expand("%:t")
    let substDict["date"] = strftime("%Y %b %d %X")
    exe '%s/<<\([^>]*\)>>/\=substDict[submatch(1)]/g'
    set nomodified
    normal G
endfunction

""
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
call SetupCommandAlias("W","w")

""
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
call SetupCommandAlias("Q","q")

""
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
call SetupCommandAlias("X","x")
""

" Floating Terminal
let g:floaterm_keymap_toggle = '<F1>'

autocmd BufNewFile *.c,*.cc,*.cpp,*.h call AddTemplate("~/.vim/skeleton.cpp")
autocmd BufNewFile *.py call AddTemplate("~/.vim/skeleton.py")

autocmd FileType cpp nnoremap <F5> :silent !g++ -o  %:r.out % -std=c++11<Enter>
autocmd FileType cpp nnoremap <F6> :!./%:r.out<Enter>
autocmd FileType cpp nnoremap <F7> :ClangFormat<Enter>
autocmd FileType cpp vnoremap <F7> :ClangFormat<Enter>


" c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

nmap <space>e :CocCommand explorer<CR>

"hi! Normal ctermbg=NONE guibg=NONE
"hi! NonText ctermbg=NONE guibg=NONE

colorscheme mountaineer-grey "OceanicNext/gruvbox/onedark1

" remap caps lock to escape and viceversa

"au VimEnter * :silent !setxkbmap -option caps:swapescape
"au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

" undo above

"au VimLeave * :silent !setxkbmap -option
"au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
