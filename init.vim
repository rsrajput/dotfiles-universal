set exrc " Wont open project .nvimrc without this here

set nu
set rnu
syntax on
set ignorecase
set nohlsearch
set hidden
set smartcase
set noswapfile
set incsearch
set termguicolors
set scrolloff=8
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set colorcolumn=80
set shortmess-=S
set pyxversion=3
set cursorline

" PYTHON PEP-8 BEGIN
set textwidth=79  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set expandtab     " insert spaces when hitting TABs
set shiftround    " round indent to multiple of 'shiftwidth'
set smartindent
" set autoindent    " align the new line indent with the previous line
" PYTHON PEP-8 END
"
"edv lua <<EOF require'nvim-treesitter.configs'.setup {} EOF
"
" OS Detection for platform specific code (from https://vi.stackexchange.com/questions/2572/detect-os-in-vimscript)
" if !exists("g:os")
"     if has("win64") || has("win32") || has("win16")
"         let g:os = "Windows"
"     else
"         let g:os = substitute(system('uname'), '\n', '', '')
"     endif
" endif

" Plant Win10 specific Begin
"
let mapleader = " "
if has('win64') || has('win32') || has('win16')
    let g:python3_host_prog = 'E:\Programs\Anaconda3\python3.exe'
    let g:coc_node_path = 'C:\PROGRA~1\nodejs\node.exe'
    let g:tagbar_ctags_bin = 'E:\Programs\Anaconda3\ctags58\ctags.exe'
    nnoremap <Leader><CR> :so ~/AppData/Local/nvim/init.vim<CR>
endif
" Plant Win10 specific End

" Macbook specific Begin
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    let g:python_host_prog = '/usr/bin/python2'
    let g:python3_host_prog = '/Users/rsrajput/opt/anaconda3/bin/python'
    nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
  else
    let g:python3_host_prog = '/usr/bin/python3'   " Linux Mint specific 
    nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
  endif
endif
" Macbook specific End

let g:ycm_filetype_whitelist = {'cpp': 1}
let g:ycm_disable_for_files_larger_then_kb = 0

let g:netrw_winsize = 20
set autoindent
filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-pyright', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-pyright'
Plug 'marcweber/vim-addon-local-vimrc'
Plug 'joshdick/onedark.vim'
Plug 'scrooloose/syntastic'
" Plug 'davidhalter/jedi-vim'

" Yes, I am a sneaky snek now
Plug 'ambv/black'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" Neovim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'

" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Debugger Plugins
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

" THANKS BFREDL
Plug 'bryall/contextprint.nvim'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline'
Plug 'sukima/xmledit'
" Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'
" Plug 'valloric/youcompleteme'
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'rust-lang/rust.vim'
Plug 'tweekmonster/gofmt.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'stsewd/fzf-checkout.vim'
Plug 'vuciv/vim-bujo'
Plug 'tpope/vim-dispatch'
Plug 'theprimeagen/vim-be-good'
Plug 'gruvbox-community/gruvbox'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-projectionist'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

"  I AM SO SORRY FOR DOING COLOR SCHEMES IN MY VIMRC, BUT I HAVE
"  TOOOOOOOOOOOOO

Plug 'colepeters/spacemacs-theme.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug '/home/mpaulson/personal/VimDeathmatch/client'

Plug 'theprimeagen/harpoon'
Plug 'ThePrimeagen/rfc-reader'
Plug 'mhinz/vim-rfc'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(69) } }

" Cheat Sheet
Plug 'dbeniamine/cheat.sh-vim'
" Plug '/home/mpaulson/personal/vim-apm'
Plug 'alvan/vim-closetag'

" Code auto format - need to run pip install yapf - In command mode, input Neoformat, neoformat will auto-format your source code.
Plug 'sbdchd/neoformat'
" VIM VISUAL MULTI - for multiple cursors - select words with Ctrl-N (like Ctrl-d in Sublime Text/VS Code)
" create cursors vertically with Ctrl-Down/Ctrl-Up
" start insert mode with i,a,I,A
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" from Youtube video "Setting up vim to work with python applications - by Miguel Grinberg
Plug 'majutsushi/tagbar'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'ap/vim-buftabline'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'nvie/vim-flake8'
Plug 'arcticicestudio/nord-vim'
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go'   " then run :GoInstallBinaries (https://medium.com/@furkanbegen/go-development-with-vim-79cfa0a928b0)
call plug#end()

let g:airline#extensions#tabline#enabled = 1

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]

lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

let g:vim_be_good_log_file = 1
let g:vim_apm_log = 1

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1

nnoremap <leader>cP :lua require("contextprint").add_statement()<CR>
nnoremap <leader>cp :lua require("contextprint").add_statement(true)<CR>

nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <C-k> :bprev<CR>
nnoremap <C-j> :bnext<CR>
nnoremap <C-q> :bdelete<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :Sex!<CR>
" nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
nnoremap <Leader>cpu a%" PRIu64 "<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" FZF use Ctrl + N and Ctrl + P or the arrow key to navigate through the list of files found by fzf. To open the file in Neovim, fzf provides several shortcut key:
" <Enter>: open file in current window
" Ctrl + T: open file in new tab page
" Ctrl + X: open file in new horizontal window
" Ctrl + V: open file in new vertical window
" To close the file search window, use Esc or Ctrl+C
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>F :FZF ~<cr>
" greatest remap ever
vnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
nnoremap <leader>P "+p

" popup resize
nnoremap <leader>x :set lines=30 <bar> :set columns=100<cr>
nnoremap <leader>v :AirlineTheme gruvbox<cr>

" vim TODO
nmap <Leader>tu <Plug>BujoChecknormal
nmap <Leader>th <Plug>BujoAddnormal
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"

nnoremap <Leader>ww ofunction wait(ms: number): Promise<void> {<CR>return new Promise(res => setTimeout(res, ms));<CR>}<esc>k=i{<CR>

inoremap jk <esc>
inoremap kj <esc>
" inoremap <C-c> <esc>

fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" ES
com! W w

nmap <F6> :NERDTreeToggle<CR>
nnoremap <F5> :set wrap!<CR>
nnoremap <silent> <F8> :TagbarToggle<CR>
" Terminal commands
" ueoa is first through fourth finger left hand home row.
" This just means I can crush, with opposite hand, the 4 terminal positions
"
" These functions are stored in harpoon.  A plugn that I am developing
nmap <leader>tu :call GotoBuffer(0)<CR>
nmap <leader>te :call GotoBuffer(1)<CR>
nmap <leader>to :call GotoBuffer(2)<CR>
nmap <leader>ta :call GotoBuffer(3)<CR>
nmap <leader>nn :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

“ GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

nnoremap <esc> :noh<return><esc>
"Remove all trailing whitespace by pressing leader W
nnoremap <leader>W :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" from Youtube video "Setting up vim to work with python applications - by Miguel Grinberg
" indent/unindent with tab/shift-tab
nmap <Tab> >>
nmap <S-tab> <<
imap <S-Tab> <Esc><<i
vmap <Tab> >gv
vmap <S-Tab> <gv
set mouse=a
let g:is_mouse_enabled = 1
colorscheme gruvbox
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" colo onedark
" augroup THE_PRIMEAGEN
"   autocmd!
"   autocmd BufWritePre * :call TrimWhitespace()
"   autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
"   autocmd BufEnter * :Vim-Apm
" augroup END

" air-line

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
