set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'puremourning/vimspector'
Plugin 'ycm-core/YouCompleteMe'
"Plugin 'itchyny/lightline.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'danilo-augusto/vim-afterglow'
Plugin 'sainnhe/sonokai'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-fugitive'
call vundle#end()            " required
filetype plugin indent on    " required

" Important!!
if has('termguicolors')
  set termguicolors
endif

" Set the cursor to blinking in insert, block elsewhere
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

"get the full mouse support
set mouse=a

" allow the arrow keys to wrap around lines
set whichwrap+=<,>,[,]

" map F8 to see tags in file
nmap <F8> :TagbarToggle<CR>

" let us see the cool statusline
set laststatus=2

" we don't need the -- INSERT -- anymore, its right down there
set noshowmode

" show the buffers at the top
let g:airline#extensions#tabline#enabled=1

" draw the pretty powerline symbols
let g:airline_powerline_fonts=1

" YouCompleteMe related
" auto close the preview window (that thing above that shows the function
" declaration and info)
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_max_diagnostics_to_display = -1
let g:ycm_min_num_identifier_candidate_chars = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_always_populate_location_list = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_auto_trigger = 1
let g:ycm_auto_hover = ''
let g:ycm_goto_buffer_command = 'split-or-existing-window'
"let g:ycm_cache_omnifunc = 0
"let g:ycm_autoclose_preview_window_after_insert = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_clangd_uses_ycmd_caching = 1
"let g:ycm_clangd_binary_path = exepath("clangd")
let g:ycm_clangd_args=['--header-insertion=never']

" Experimental
let g:ycm_enable_semantic_highlighting=1
let g:ycm_enable_inlay_hints=1

nnoremap <F5>        :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>gic :rightbelow vertical YcmCompleter GoToInclude<CR>
nnoremap <leader>gdc :rightbelow vertical YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gdf :rightbelow vertical YcmCompleter GoToDefinition<CR>
nnoremap <leader>gip :rightbelow vertical YcmCompleter GoToImprecise<CR>
nnoremap <leader>grr :rightbelow vertical YcmCompleter RefactorRename
nnoremap <leader>grf :YcmCompleter GoToReferences<CR>
nnoremap ;d          :rightbelow vertical YcmCompleter GoToDefinition<CR>
nnoremap ;r          :YcmCompleter GoToReferences<CR>
nnoremap <leader>f   :YcmCompleter FixIt<CR>

" linenumbers are cool too
set nu

" hihgliting the lines
hi CursorLine cterm=bold ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"hi CursorColumn cterm=NONE ctermbg=red  ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :set cursorline! <CR>
" cursorcolumn!<CR>
" afterglow setup
" colorscheme afterglow
let g:airline_theme='sonokai'
" let g:afterglow_italic_comments=1
" enable omnifunc
set omnifunc=syntaxcomplete#Complete
colorscheme sonokai

" search stuff
set incsearch hlsearch ignorecase smartcase smartcase matchpairs+=<:> matchtime=5
" clear search highlight using leader key + Space or leader + c
nnoremap <Leader><Space> :nohlsearch<CR>
" tab stuff
set ts=4 sw=4 sts=4 expandtab autoindent smartindent cindent smarttab smartcase showmatch
set whichwrap+=<,>,h,l,[,]

