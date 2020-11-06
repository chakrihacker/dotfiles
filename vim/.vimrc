" General Settings
set nocompatible
filetype plugin on
syntax on
set number	" Show line numbers
set hidden      " Undo persists even when switching to different open buffers
set scrolloff=15	" Cursor movement
set background=dark    " Setting dark mode
set splitbelow	" opens split below by default in horizontal
set splitright	" opens split right by default in vertical

" From CoC ReadMe
set shortmess+=c	" Don't pass messages to |ins-completion-menu|.
set signcolumn=yes	" always show signcolumns
" End of CoC ReadMe

" End of General Settings

" VimPlug automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" VimPlug automatic installation end

" Vim Plugins
call plug#begin()

Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'peitalin/vim-jsx-typescript' " TSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocomplete
Plug 'preservim/nerdtree'         " File Explorer
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'epilande/vim-react-snippets'
Plug 'vimwiki/vimwiki'            " VimWiki
Plug 'morhetz/gruvbox'            " GruvBox Theme
Plug 'editorconfig/editorconfig-vim' " Editor Config

call plug#end()

" End of Plugins

" Plugin Specific Settings
" Any thing that starts with let g: are plugin specific

" CoC extensions
let g:coc_global_extensions = [
\ 'coc-tsserver', 
\ 'coc-json',
\ 'coc-snippets',
\ 'coc-pairs',
\ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Vim airline settings
let g:airline_powerline_fonts = 1

" Git Gutter settings
let g:gitgutter_enabled = 0

" End of Plugin Specific Settings

" Custom key mappings

" Easier movement between split windows CTRL + {h, j, k, l}
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Show autocomplete when Tab is pressed
inoremap <silent><expr> <Tab> coc#refresh()
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>


" End of Custom key mappings

" Custom functions

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" End of custom functions


" AutoCommands
" NerdTree settings
autocmd vimenter * NERDTree
autocmd VimEnter * if argc() | wincmd p | endif
map <C-n> :NERDTreeToggle<CR>

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Set GruvBox as vim theme
autocmd vimenter * colorscheme gruvbox
" End of AutoCommands

