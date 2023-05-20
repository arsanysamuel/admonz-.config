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
"Plug 'junegunn/goyo.vim'  " aligning text to center with :Goyo
Plug 'vimwiki/vimwiki'  " Personal wiki for vim (org mode alternative

" IDE Plugins:
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Better syntax completion. dependencies: nodejs, npm, yarn, 'pip install neovim pynvim jedi', 'npm install -g neovim', 'gem install neovim' , 'pacman -S jedi-language-server', :CocInstall coc-python coc-jedi
Plug 'preservim/nerdtree'  " File tree, binded to \
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  " for nerdtree file names according to extension, works well with devicons
Plug 'johnstef99/vim-nerdtree-syntax-highlight'  " for nerdtree file names according to extension, works well with devicons (maintained fork)
Plug 'ryanoasis/vim-devicons'  " showing file icons in nerdtree, nerdfonts is a dependency
Plug 'bfrg/vim-cpp-modern'  " C++ syntax hightlighting
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}  " Python syntax highlighting
Plug 'majutsushi/tagbar'  " display tags in a window orderd by scope, still needs some configuration
"Plug 'Xuyuanp/nerdtree-git-plugin'  " showing git status in nerdtree, will use it one day
"Plug 'airblade/vim-gitgutter'  " shows git diff in the sign column(the one on the left), will get to it later
Plug 'alvan/vim-closetag'  " Auto close html tag
Plug 'preservim/nerdcommenter'  " commenting key bindings, needs more config
"Plug 'chrisbra/Colorizer'
Plug 'ap/vim-css-color'  " highlights color values with the corresponding color
"Plug 'ycm-core/YouCompleteMe'  " Syntax completion, coc is a better alternative
"Plug 'hdima/python-syntax'  " probably will never use it as long as I'm using semshi with neovim 
Plug 'Raimondi/delimitMate'  " auto close parenthesis, qutoes, etc.
"Plug 'vim-syntastic/syntastic'  " syntax checker/linter, needs more config
Plug 'preservim/vim-indent-guides'  "indent guide lines


" LaTeX Plugins:
Plug 'lervag/vimtex'  " some latex thing that I can't get, probably just a bloat
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }  " latex previewer whith :LLPStartPreview
Plug 'goballooning/vim-live-latex-preview'  " vim live preview realtime

" MD Plugins:
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }  " md live preview, see github if yarn and nodejs are absent

" Other Languages Plugins:
Plug 'peterhoeg/vim-qml'  " Qt Qml syntax highlighting
Plug 'Glench/Vim-Jinja2-Syntax'  " Jinja syntax hightlighting

" Colorsheme Plugins:
"Plug 'junegunn/seoul256.vim'   
"Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
"Plug 'tomasiser/vim-code-dark'
"Plug 'altercation/vim-colors-solarized'

"Plug 'rlue/vim-barbaric' "non latin input but useless and non effictive

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


" WILL BE DEPRICATED: this is for nerd tree after addinf pathogen.vim to ~/.vim/autoload/
"execute pathogen#infect()



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

"enable syntax highlight, and for vimwiki and several plugins
syntax on 

" Vim Wiki Config:
let g:vimwiki_list = [{'path': '$VIMWIKI',
			\ 'syntax': 'markdown'}]
let g:vimwiki_folding='list'

"enable spell checking
"set spell spelllang=en_us
"setlocal spell spelllang=en_us  " for local buffer only

" Arabic Support: nothing works
set arabicshape
"set termbidi
"set rl  " changes the screen orientation to rtl
"set ri  " enables reverse insert

"specify the number of spaces for a tab
set tabstop=4 

" expand tabs into spaces
set expandtab

" Set number of shifts when using >> or <<
set shiftwidth=4

" highlight current cursor column and row
"set cursorcolumn
"set cursorline

" show the matching part of the pair for [] {} and ()
"set showmatch

"auto indentation
set autoindent 

"detects filetype for syntax highlighting etc
filetype on 
filetype plugin on  " for vimwiki

"detects the suitable plugin for every file typeand sets the suitable indentation for it
filetype indent plugin on 

"removes distro and old features comptability, and for vimwiki
set nocompatible 

"to keep the undo history and buffer after closing vim for the same window 
set hidden 

"better commendline completion
set wildmenu 

"this and the following command are for ignoring capitalization in search unless typing capital letters in the search term
set ignorecase 

"read the manual
set smartcase  


" use visual bell instead of beeping
set visualbell 

" set encoding
"set encoding=UTF-8 

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

" LaTeX live preview config
let g:livepreview_previewer = 'zathura'
let g:livepreview_use_biber = 1
let g:livepreview_cursorhold_recompile = 0

" This for enabling code folding for python or any indented text with space
set foldmethod=indent
set foldlevel=99
set background=dark

set guicursor= " resolving issue of cursor disappear in insert mode in neovim

"" for closing ycm scratch menu automatically (because it's annoying)  " unused anymore
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_autoclose_preview_window_after_completion = 1

" mutt/neomutt settings:
au BufRead /tmp/mutt-* set tw=72  " sets text width to 72 for email buffer

" utf support 
set encoding=utf-8

" vim clipboard to system clipboard
set clipboard=unnamedplus

" vim-indent-guides auto enable
let g:indent_guides_enable_on_vim_startup = 1


" Key Bindings:

"code folding
"nnoremap <space> za  "unneeded for now 

nnoremap <F5> :NERDTreeToggle<CR>
" Inside NERDTree keymaps
let NERDTreeMapOpenInTab = 't'
let NERDTreeMapOpenInSplit = 's'
let NERDTreeMapToggleHidden = 'H'

nnoremap <F6> :TagbarToggle<CR>
map <C-c> <plug>NERDCommenterToggle

" md previewer, will improve to preview latex or md depending on extension
autocmd FileType markdown,vimwiki nmap <C-p> <Plug>MarkdownPreviewToggle
autocmd FileType tex nmap <C-p> :LLPStartPreview<CR>


"" Syntastic sensible config:
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0


"jedi venv config
let g:virtualenv_auto_activate = 1

" jsonc commenting
autocmd FileType json syntax match Comment +\/\/.\+$+

" qml filetype tab spacing
autocmd FileType qml setlocal tabstop=4 shiftwidth=4 expandtab softtabstop=4

" delimitMate config
autocmd FileType html let b:loaded_delimitMate = 0  " disable the plugin for html files (conflicts with closetag.vim)
autocmd FileType jinja.html let b:loaded_delimitMate = 0  " disable the plugin for html files (conflicts with closetag.vim)
autocmd FileType vim let b:delimitMate_quotes = "'"  " setting quotes in vimrc files to ' only (pairing the double quote is annoying for comments)



" Coc Official Config:
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
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
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
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

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

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

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

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
