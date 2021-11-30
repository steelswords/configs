set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" YouCompleteMe
Plugin 'https://github.com/ycm-core/YouCompleteMe.git'
" For PlantUML previewer
Plugin 'https://github.com/tyru/open-browser.vim.git'
Plugin 'https://github.com/aklt/plantuml-syntax.git'
Plugin 'https://github.com/weirongxu/plantuml-previewer.vim.git'
Plugin 'tomasiser/vim-code-dark'
Plugin 'derekwyatt/vim-fswitch'
" For quick comments
Plugin 'https://github.com/tpope/vim-commentary'

" Telescope is only for neovim, unfortunately.
if has('nvim')
  Plugin 'nvim-lua/plenary.nvim'
  Plugin 'nvim-telescope/telescope.nvim'
endif

" UltiSnips
Plugin 'https://github.com/sirver/UltiSnips'
Plugin 'majutsushi/tagbar'
Plugin 'iamcco/markdown-preview.nvim'
" Run this after installing markdown preview:
" :source %
" :PluginInstall
" :call mkdp#util#install()



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" Put your non-Plugin stuff after this line

set colorcolumn=81
highlight ColorColumn ctermbg=0

command Newt tabnew

set runtimepath^=~/.vim/plugins/swap_lines.vim

let g:ycm_show_diagnostics_ui = 0
set colorcolumn=81
highlight ColorColumn ctermbg=0

set runtimepath^=~/.vim/plugins/swap_lines.vim

>>>>>>> eea1da0 (Add neovim configs)
" Enable hybrid numbers
set nu rnu
set smarttab

syntax on
"Original tab behavior:
"set tabstop=2
"set softtabstop=0 expandtab smarttab
"set shiftwidth=2
"Fixed tab behavior:
set tabstop=2
set softtabstop=0 noexpandtab 

set autoindent

"Shiftwidth is the size of an 'indent', measured in spaces. 
set shiftwidth=2
set expandtab
"set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵,extends:→,precedes:←
set listchars=tab:>·,trail:␠,nbsp:⎵,extends:→,precedes:←
set list

set statusline+=%F

"Forces vim to use tags files from parent directories too.
"<rant> Should be the default, but ok. </rant>
set tags=tags;

filetype plugin on

"Enable * to highlight search word and define F11 to turn it off
set hls
nnoremap <S-F11> <ESC>:set hls! hls?<cr>
inoremap <S-F11> <C-o>:set hls! hls?<cr>
vnoremap <S-F11> <ESC>:set hls! hls?<cr> <bar> gv

"Enable sudo-on-the-fly
command IamtheKING w !sudo tee %

"cmap w!! w !sudo tee %

set t_Co=256
set t_ut=
colorscheme codedark

autocmd FileType xml        setlocal tabstop=4 shiftwidth=4 softtabstop=4

"Press \g to see a git blame of something selected in visual mode
vmap <Leader>g :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" YouCompleteMe options
let g:ycm_auto_hover = ''

" PlantUML Previewer options
"let g:plantuml_previewer#plantuml_jar_path = '/home/tandrus/Applications/plantuml.jar'

" Enable this to enable mouse scrolling and selecting in tmux
" Spoiler: Not worth it
" set mouse=a

" To use: install silversearcher's ag
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Bind Ctrl-H to switch between header and cpp
nnoremap <silent> <C-h> :FSHere<CR>

" Bind Ctrl-R to replace the highlighted text in visual mode
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" NeoVim-specific bindings.
" Telescope bindings
if has('nvim')
  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
  nnoremap <leader>fh <cmd>Telescope help_tags<cr>
  nnoremap <leader>vg <cmd>Telescope grep_string<cr>
endif

"UltiSnips bind to c-j
"let g:UltiSnipsExpandTrigger = "<M-x>"
let g:UltiSnipsExpandTrigger = "<C-j>"
"let g:UltiSnipsJumpForwardTrigger = "<M-j>"
"let g:UltiSnipsJumpBackwardTrigger = "<M-k>"

"""""""""""""" MarkdownPreview configs
let g:mkdp_auto_close = 1
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
let g:mkdp_filetypes = ['markdown']

"Make the current tab more visible
highlight TabLineSel ctermfg=Blue
