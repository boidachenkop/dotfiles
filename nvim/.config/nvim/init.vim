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
Plug 'https://github.com/ervandew/supertab'

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

" Deoplete
Plug 'https://github.com/Shougo/deoplete.nvim'
Plug 'https://github.com/Shougo/deoplete-clangx'

" Vimtex support for tex documents
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

" -- LanguageClient_neovim
" Language Client support[usually i install cquery]
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" Multi-entry selection UI. FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" ---

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
nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Resize split maping
nnoremap <silent> <Leader>+ :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
nnoremap <silent> <Leader>= <C-W>=

" --- DEOPLETE
" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
call deoplete#custom#source('LanguageClient',
            \ 'min_pattern_length',
            \ 2)
" Deoplete for tex files
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})
" ---

" --- LanguageClient_neovim
let g:LanguageClient_serverCommands = {
    \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
    \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
    \ }

let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
let g:LanguageClient_settingsPath = '~/.config/nvim/settings.json'
set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()

nnoremap <silent> <leader>gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <leader>gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <leader>gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> <leader>gs :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
 nnoremap <silent> <leader>gdt :call LanguageClient#textDocument_definition({  'gotoCmd': 'tabedit',  })<CR>
 nnoremap <silent> <leader>gdv :call LanguageClient#textDocument_definition({  'gotoCmd': 'vs',  })<CR>
" ---

" --- FZF 
" This is the default extra key bindings
nnoremap <C-p> :Files<CR>

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

" Supertab correct deoplete backward tabbing
let g:SuperTabDefaultCompletionType = "<c-n>"

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
" Vimtex previewer
let g:vimtex_view_general_viewer = 'evince'

" This unsets the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>

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
set termguicolors
syntax enable
colorscheme dracula



