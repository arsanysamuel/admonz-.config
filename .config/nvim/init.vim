"         _                    
"  __   _(_)_ __ ___  _ __ ___ 
"  \ \ / / | '_ ` _ \| '__/ __|
"   \ V /| | | | | | | | | (__ 
"    \_/ |_|_| |_| |_|_|  \___|
"
" https://gitlab.com/arsanysamuel/dotfiles
"



" Vim Plug Config:

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugged')

" Declare the list of plugins.

" Misc:
Plug 'tpope/vim-sensible'  " Sensible config for vim, tpope is awsome
Plug 'junegunn/goyo.vim'  " aligning text to center with :Goyo

" IDE Plugins:
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Better syntax completion. dependencies: nodejs, npm, yarn, 'pip install neovim pynvim jedi', 'npm install -g neovim', 'gem install neovim' , 'pacman -S jedi-language-server vim-jedi', :CocInstall coc-python coc-jedi
Plug 'preservim/nerdtree'  " File tree, binded to \
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  " for nerdtree file names according to extension, works well with devicons
Plug 'ryanoasis/vim-devicons'  " showing file icons in nerdtree, nerdfonts is a dependency
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}  " Python syntax highlighting
Plug 'majutsushi/tagbar'  " display tags in a window orderd by scope, still needs some configuration
"Plug 'Xuyuanp/nerdtree-git-plugin'  " showing git status in nerdtree, will use it one day
"Plug 'airblade/vim-gitgutter'  " shows git diff in the sign column(the one on the left), will get to it later
Plug 'preservim/nerdcommenter'  " commenting key bindings, needs more config
"Plug 'chrisbra/Colorizer'
Plug 'ap/vim-css-color'  " highlights color values with the corresponding color
"Plug 'ycm-core/YouCompleteMe'  " Syntax completion, coc is a better alternative
"Plug 'hdima/python-syntax'  " probably will never use it as long as I'm using semshi with neovim 
Plug 'Raimondi/delimitMate'  " auto close parenthesis, qutoes, etc.
"Plug 'tpope/vim-surround'  " mappings for deleting, changing adding parenthesis, etc. incompatible for now 


" LaTeX Plugins:
Plug 'lervag/vimtex'  " some latex thing that I can't get, probably just a bloat
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }  " latex previewer whith :LLPStartPreview
Plug 'goballooning/vim-live-latex-preview'  " vim live preview realtime

" Colorsheme Plugins:
Plug 'junegunn/seoul256.vim'   
"Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'altercation/vim-colors-solarized'

"Plug 'rlue/vim-barbaric' "non latin input but useless and non effictive

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


" this is for nerd tree after addinf pathogen.vim to ~/.vim/autoload/
execute pathogen#infect()  





" User Defined Config:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color scheme:
"colorscheme codedark
colorscheme gruvbox
"let g:solarized_termcolors=256
"colorscheme solarized
"set background=dark
"colo seoul256
"colorscheme nord  " didn't like it that much

"show line numbers and relative numbers to the line

set number relativenumber  

"enable syntax highlight
syntax on 

"enable spell checking
"set spell spelllang=en_us
"setlocal spell spelllang=en_us  " for local buffer only

" Arabic Support: noting works
set encoding=utf-8
"set termbidi
"set arabicshape
"set rl

"specify the number of spaces for a tab
"set tabstop=4 

" expand tabs into spaces
"set expandtab

" highlight current cursor column and row
"set cursorcolumn
"set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

"auto indentation
set autoindent 

"detects filetype for syntax highlighting etc
filetype on 

"detects the suitable plugin for every file typeand sets the suitable indentation for it
filetype indent plugin on 

"removes distro and old features comptability
set nocompatible 

"to keep the undo history and buffer after closing vim for the same window 
set hidden 

" arabic support
" set arabicshape!

"better commendline completion
set wildmenu 

"this and the following command are for ignoring capitalization in search unless typing capital letters in the search term
set ignorecase 

"read the manual
set smartcase  


" use visual bell instead of beeping
set visualbell 

" set encoding
set encoding=UTF-8 

" auto completion for vim commands
set wildmode=longest,list,full  

" enable all python syntax highlighting features
let python_highlight_all = 1

" disables auto commenting on new lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o  

" Color highlight, couldn't configure properly
" :h Colorizer
"let g:colorizer_auto_color = 1
"let g:colorizer_auto_filetype='css,html,py,tex'
"let g:colorizer_skip_comments = 1

" vimtex flavor for loading vimtex plugin
let g:tex_flavor = 'latex'

" LaTeX live view default pdf viewer
let g:livepreview_previewer = 'zathura'

" This for enabling code folding for python or any indented text with space
set foldmethod=indent
set foldlevel=99
set background=dark

set guicursor= " resolving issue of cursor disappear in insert mode in neovim

" for closing ycm scratch menu automatically (because it's annoying)
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" this one is for python syntax plugin, check github page for more options, unused with neovim
"let python_highlight_all = 1


" Key Bindings:

"code folding
"nnoremap <space> za  "unneeded for now 

nnoremap [[ :NERDTreeToggle<CR>
" Inside NERDTree keymaps
let NERDTreeMapOpenInTab = 't'
let NERDTreeMapOpenInSplit = 's'
let NERDTreeMapToggleHidden = 'H'

nnoremap ]] :TagbarToggle<CR>
map <C-c> <plug>NERDCommenterToggle













" NOTE: all of the following lines are COC config
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
