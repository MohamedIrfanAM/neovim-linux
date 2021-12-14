" Basic Key Mappings

" g Leader key
let mapleader=" "
" let localleader=" "
nnoremap <Space> <Nop>

" Better indenting
vnoremap < <gv
vnoremap > >gv

if exists('g:vscode')

  " Simulate same TAB behavior in VSCode
  nmap <Tab> :Tabnext<CR>
  nmap <S-Tab> :Tabprev<CR>

else

" For CPbooster
  nnoremap <a-t> :Test<CR>
  nnoremap <a-T> :Rtest<CR>
  nnoremap <a-d> :Debug<CR>
  nnoremap <a-D> :Rdebug<CR>
  nnoremap <a-s> :Submit<CR>
  nnoremap <a-a> :Addtc<CR>

  " Snippets 
  inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <TAB> for jump to next placeholder, it's default of coc.nvim
  let g:coc_snippet_next = '<TAB>'

  " Use <S-TAB> for jump to previous placeholder, it's default of coc.nvim
  let g:coc_snippet_prev = '<S-TAB>'

  " Use <TAB> for select text for visual placeholder of snippet.
  vmap <TAB> <Plug>(coc-snippets-select)


  " Vscode like opening and closing
  nnoremap <C-e> :CocCommand explorer --toggle --sources=file+<CR>
  noremap <C-w> :tabclose<CR>
  noremap <C-w> :Bclose<CR>
  nnoremap <C-o> :RnvimrToggle<CR>

  " Better nav for Coc Completion
  inoremap <expr> <C-j> ("\<C-n>")
  inoremap <expr> <C-k> ("\<C-p>")

  " I hate escape more than anything else
  inoremap jk <Esc>
  inoremap kj <Esc>
  inoremap jj <Esc>
  
  " Easy CAPS
  " inoremap <c-u> <ESC>viwUi
  " nnoremap <c-u> viwU<Esc>

  " TAB in general mode will move to text buffer
  nnoremap <silent> <TAB> :bnext<CR>
  " SHIFT-TAB will go back
  nnoremap <silent> <S-TAB> :bprevious<CR>

  " Move selected line / block of text in visual mode
  " shift + k to move up
  " shift + j to move down
  xnoremap K :move '<-2<CR>gv-gv
  xnoremap J :move '>+1<CR>gv-gv
  
  " Alternate way to save
  nnoremap <silent> <C-s> :w<CR>
  " Alternate way to quit
  nnoremap <silent> <C-Q> :wq!<CR>

  " Better window navigation
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  " Terminal window navigation
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l
  inoremap <C-h> <C-\><C-N><C-w>h
  " inoremap <C-j> <C-\><C-N><C-w>j
  " inoremap <C-k> <C-\><C-N><C-w>k
  " inoremap <C-l> <C-\><C-N><C-w>l
  tnoremap <Esc> <C-\><C-n>

  " Resizing windows
  nnoremap <silent> <C-Up>    :resize -2<CR>
  nnoremap <silent> <C-Down>  :resize +2<CR>
  nnoremap <silent> <C-Left>  :vertical resize -2<CR>
  nnoremap <silent> <C-Right> :vertical resize +2<CR>

  let g:elite_mode=0                      " Disable arrows"
  " Disable arrow movement, resize splits instead.
  if get(g:, 'elite_mode')
      nnoremap <C-Up>    :resize -2<CR>
      nnoremap <C-Down>  :resize +2<CR>
      nnoremap <C-Left>  :vertical resize -2<CR>
      nnoremap <C-Right> :vertical resize +2<CR>
  endif

endif

" lf and fl for right arrow 
inoremap <expr> fl getline('.')[col('.')-1] =~? '[]>)}''"`]' ? '<right>' : '<right>' 
inoremap <expr> lf getline('.')[col('.')-1] =~? '[]>)}''"`]' ? '<right>' : '<right>' 

" Y to yank upto end of line
map Y <Esc>y$
