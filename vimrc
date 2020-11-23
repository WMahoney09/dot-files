" Boiler
set mouse=n
set nocompatible              " be iMproved, required
syntax enable

set nu
set ru
set ttimeoutlen=50 			  " fix delay in status line mode switch
filetype off                  " required
set expandtab
set smarttab
set tabstop=4
set shiftwidth=2
set softtabstop=0
set laststatus=2
"set autoindent
set hlsearch
set cursorline

"Fold config
set foldmarker=\/\*\*,\*\/
set foldmethod=marker

" Plugins
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim


call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'alvan/vim-closetag'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdTree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'ddollar/nerdcommenter'
Plugin 'ntpeters/vim-better-whitespace'

" prefer ale to syntastic
" Plugin 'vim-syntastic/syntastic'
Plugin 'dense-analysis/ale'

Plugin 'mileszs/ack.vim'
Plugin 'gregsexton/gitv'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'Raimondi/delimitMate'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'fatih/vim-go'
Plugin 'Yggdroot/indentLine'

" TypeScript support
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'

" color schemes
Plugin 'nanotech/jellybeans.vim'
Plugin 'mhartington/oceanic-next'
Plugin 'morhetz/gruvbox'
Plugin 'joshdick/onedark.vim'
Plugin 'ajh17/spacegray.vim'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ghifarit53/tokyonight-vim'
Plugin 'jsit/toast.vim'

" markdown preview
Plugin 'JamshedVesuna/vim-markdown-preview'

" Coc
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Halp
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

" Markdown Preview
let vim_markdown_preview_toggle=1
let vim_markdown_preview_hotkey='<C-M>'
let vim_markdown_preview_browser="Gogle Chrome"
let vim_markdown_preview_github=1

" Linter
let g:ale_set_highlights=0
let g:ale_fixers={
\   'javascript': ['prettier'],
\   'javascript.jsx': ['prettier'],
\   'typescript': ['prettier'],
\   'typescript.tsx': ['prettier'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\}
let g:ale_fix_on_save=1
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_javascript_checkers=['eslint']
" let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
" let g:syntastic_always_populate_loc_list=1
" let g:syntastic_loc_list_height=5
" let g:syntastic_auto_loc_list=0
" let g:syntastic_check_on_open=1
" let g:syntastic_check_on_wq=0
" hi SyntasticErrorSign ctermfg=yellow ctermbg=red
" "let g:syntastic_debug=3
" let g:syntastic_mode_map={
      " \ "mode":"active",
      " \ "passive_filetypes": ["go"] }

" Vim Airline
let g:airline_theme='oceanicnext'
" let g:airline_theme='luna'
let g:airline#extensions#branch#displayed_head_limit=20
let g:airline#extensions#default#layout = [
      \['a', 'b', 'c'],
      \['z', 'error', 'warning']
      \]
let g:airline#extensions#default#section_truncate_width = {
      \ 'b': 4,
      \ 'x': 4,
      \ 'y': 4,
      \ 'z': 4
      \ }
let g:airline_powerline_fonts=1

" Colors
" default schemes can be found in `/usr/share/vim/vim80/colors`
set background=dark
" let g:solarized_visibility='high'
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext
" colorscheme jellybeans
hi Search cterm=NONE ctermfg=Grey ctermbg=DarkRed
hi Comment cterm=italic
hi String cterm=italic
set t_ZH=[3m
set t_ZR=[23m

" CtrlP
let g:ctrlp_custom_ignore='node_modules\|git'
set wildignore+=**/node_modules/**,**/darwin_amd64/**,**/pkg/mod/**

" Nerd Tree
let g:NERDTreeWinSize =42
" Nerd Commenter
let g:NERDSpaceDelims = 1

" Silver Searcher
if executable('ag')
  " Use ag over grep
  let g:ackprg='ag --vimgrep'

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" HTML Close Tag settings
let g:closetag_filenames='*.html,*.xml,*.jsx,*.tsx'
let g:closetag_xhtml_filenames='*.jsx,*.tsx'
let g:closetag_emptyTags_caseSensitive=1
let g:closetag_shortcut='>'

" indentLine
let g:indentLine_char = '·'


"""""""""""""""""""""""""""""""""""""""""""""""""""
" CoC config
" TextEdit might fail if hidden is not set.
set hidden

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

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plugin>(coc-diagnostic-prev)
nmap <silent> ]g <Plugin>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plugin>(coc-definition)
nmap <silent> gy <Plugin>(coc-type-definition)
nmap <silent> gi <Plugin>(coc-implementation)
nmap <silent> gr <Plugin>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plugin>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plugin>(coc-format-selected)
nmap <leader>f  <Plugin>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plugin>(coc-codeaction-selected)
nmap <leader>a  <Plugin>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plugin>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plugin>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plugin>(coc-funcobj-i)
omap if <Plugin>(coc-funcobj-i)
xmap af <Plugin>(coc-funcobj-a)
omap af <Plugin>(coc-funcobj-a)
xmap ic <Plugin>(coc-classobj-i)
omap ic <Plugin>(coc-classobj-i)
xmap ac <Plugin>(coc-classobj-a)
omap ac <Plugin>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plugin>(coc-range-select)
xmap <silent> <C-s> <Plugin>(coc-range-select)

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
  " Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction Do default action for next item.

nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" end Coc config
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Key Mappings
nnoremap <C-E> :NERDTreeToggle<CR>
nnoremap <C-F> :NERDTreeFind<CR>
nnoremap <C-O> :diffget<CR> ]c
nnoremap <C-I> :diffput<CR> ]c
nnoremap <C-X> :Gstatus<CR>:res 9<CR>
nnoremap Fg :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap Ff :Ack! "\b<C-R><C-W>\b" <C-R>%<CR>:cw<CR>
cnoreabbrev ag Ack!
nnoremap <C-L> :Errors<CR><C-W>j
imap <C-c> <CR><Esc>O



" Go specific settings
" Format and fix Imports on save
let g:go_fmt_command="goimports"
let g:go_fmt_experimental = 1
" Mappings
nnoremap gi :GoImplements<cr>
nnoremap gr :GoReferrers<cr>
au BufWritePost *.go silent :GoTest
au BufRead,BufNewFile *.ts   setfiletype typescript

augroup go
  autocmd!
  autocmd Filetype go
        \  setlocal shiftwidth=4 tabstop=4 noexpandtab nosmarttab
        \| command! -bang A call go#alternate#Switch(<bang>0, 'edit')
        \| command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
        \| command! -bang AS call go#alternate#Switch(<bang>0, 'split')
augroup END

" change git commit msg overflow highlighting
au FileType gitcommit
  \ hi gitcommitOverflow ctermfg=red

"Linting and prettier
" au FileType javascript setlocal formatprg=prettier
" au FileType javascript.jsx setlocal formatprg=prettier
" au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
" au FileType typescript.tsx setlocal formatprg=prettier\ --parser\ typescript
" au FileType css setlocal formatprg=prettier\ --parser\ css
" au FileType scss setlocal formatprg=prettier\ --parser\ css
