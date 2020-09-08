" =============================================================================================
"                                              PLUGINS
" =============================================================================================

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Bracketing pair
Plug 'https://github.com/jiangmiao/auto-pairs'

" Multiple cursors
Plug 'https://github.com/terryma/vim-multiple-cursors'
" Tab autocomplete
" Plug 'https://github.com/ervandew/supertab'

" A for switching between file and header
Plug 'https://github.com/vim-scripts/a.vim'

" Better C++ syntax highliting
Plug 'https://github.com/octol/vim-cpp-enhanced-highlight'

" airline (powerline)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git brunch
Plug 'https://github.com/itchyny/vim-gitbranch'

" Colorscheme
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'https://github.com/dracula/vim'

" Vimtex support for tex documents to start press \ll
Plug 'lervag/vimtex'

" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'https://github.com/ying17zi/vim-live-latex-preview', {'for': 'tex'}

" Surround 
" cs[what to change][what to put]
Plug 'https://github.com/tpope/vim-surround'

" Comment 
" gc[c - line][other operator]
Plug 'https://github.com/tpope/vim-commentary'

" Titlecase 
" <leader>gt[region to titlecase] or <leader>gT - titlecase line
Plug 'https://github.com/christoomey/vim-titlecase'

" --- User textobjects
Plug 'https://github.com/kana/vim-textobj-user' 
" Textobject - line. al - outter lineobject. il - inner lineobject(after indent)
Plug 'https://github.com/kana/vim-textobj-line' 
" Textobject - indent. ai - outter indent. ii - inner indent
Plug 'https://github.com/kana/vim-textobj-indent'
" ---

" Clang Format
Plug 'https://github.com/rhysd/vim-clang-format'

" Rip Grep - find text in files
Plug 'https://github.com/jremmen/vim-ripgrep'

" Multi-entry selection UI. FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" ---

" Git wrapper
Plug 'https://github.com/tpope/vim-fugitive'

" COC - language server protocol
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" NERD tree - tree view 
Plug 'preservim/nerdtree'

call plug#end()

" =============================================================================================
"                                       CORE STUFF
" =============================================================================================

" Esc keymap
imap wj <esc>

" Remap 'leader'
let mapleader=","

" Search case unsensetive
set ignorecase
set hlsearch

" Delete swap files after recover
augroup AutomaticSwapRecoveryAndDelete
   autocmd!
   autocmd SwapExists * :let v:swapchoice = 'r' | let b:swapname = v:swapname 
   autocmd VimLeave * :if exists("b:swapname") | call delete(b:swapname) | endif
augroup end

" Auto refresh files that haven't been edited by Vim 
set autoread

" Copy to clopboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Spell check. F11 to turn on
set spelllang=en,pl,cjk
nnoremap <silent> <F10> :set spell!<cr>
inoremap <silent> <F10> <C-O>:set spell!<cr>

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Resize split maping
nnoremap <silent> <Leader>+ :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
nnoremap <silent> <Leader>= <C-W>=

" --- FZF 
" This is the default extra key bindings
nnoremap <C-p> :Files<CR>
nnoremap gs :BTags<CR>

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'down': '~40%', 'window': '10new' }
command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)
let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" ---

" Supertab correct coc backward tabbing
" let g:SuperTabDefaultCompletionType = "<c-n>"

" Disable new line comment in vimrc
au BufEnter * set fo-=c fo-=r fo-=o

" Enable mouse
set mouse=a

" Start scrolling 8 lines away from window margins
set scrolloff=8

" History
set history=1000

" Better split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Fast tab switching
nnoremap H gT
nnoremap L gt

" Tabulation preferences
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent
set smartindent
set cindent 
set cino+=g0
" Tab visible
"set list
"set listchars=tab:\

" Filetype detection
filetype plugin on
set splitbelow
set splitright

" Titlecase default to gt(which is switch tab), so remap it
let g:titlecase_map_keys = 0
nmap <leader>gt <Plug>Titlecase
vmap <leader>gt <Plug>Titlecase
nmap <leader>gT <Plug>TitlecaseLine

" Latex preview prevent document update when cursor holds
let g:livepreview_cursorhold_recompile = 0
" suppress warnings 
let g:tex_flavor = 'latex'
let g:vimtex_quickfix_latexlog = {'default' : 0}
" Vimtex previewer
let g:vimtex_view_general_viewer = 'evince'
let g:vimtex_quickfix_mode = 1
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_autoclose_after_keystrokes = 2

" This unsets the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>

" --- CoC - language server protocol

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Close the preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <leader>gdt :call CocAction('jumpDefinition', 'tab drop')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" ---

" NERD tree
map <leader>n :NERDTreeToggle<CR>

" =============================================================================================
"                                       PRETTY STUFF
" =============================================================================================

" Font for Air-line
set guifont=Liberation\ Mono\ for\ Powerline\ 10 
" Air-line 
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'

if !exists('g:airline_symbols')
   "let g:airline_symbols = {}
endif
let g:airline_theme = 'dracula'
" Airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
"let g:airline_symbols.linenr = ''

function! AirlineInit()
   let g:airline_section_a = airline#section#create(['mode'])
   let g:airline_section_b = gitbranch#name()
   let g:airline_section_c = airline#section#create(['%f'])
   let g:airline_section_x = ''
   let g:airline_section_y = airline#section#create(['filetype'])
   let g:airline_section_z = airline#section#create(['linenr',':','%c%V'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()
let g:airline_skip_empty_sections = 1
let g:airline#extensions#whitespace#enabled = 0

let g:cpp_member_variable_highlight = 1

" Relative line numbering(hybrid)
set number relativenumber
set nu rnu

" Show current command in normal mode
set showcmd

" Tab label is a filename instead of path
set guitablabel=%t

" Colorscheme
set notermguicolors
syntax enable
let g:vim_monokai_tasty_italic = 1
" colorscheme vim-monokai-tasty
colorscheme dracula




