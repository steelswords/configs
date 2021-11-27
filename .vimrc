set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'NERD_tree-Project'

Plugin 'ycm-core/YouCompleteMe'
" Track the engine.
"Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<c-i>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"



" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

<<<<<<< HEAD
set colorcolumn=81
highlight ColorColumn ctermbg=0

command Newt tabnew

set runtimepath^=~/.vim/plugins/swap_lines.vim

=======
let g:ycm_show_diagnostics_ui = 0
>>>>>>> 9f80046 (Updates before merging in neovim support)
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

colorscheme elflord

autocmd FileType xml        setlocal tabstop=4 shiftwidth=4 softtabstop=4

"Press \g to see a git blame of something selected in visual mode
vmap <Leader>g :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
