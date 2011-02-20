" setup the language options in the beginning
if has("multi_byte")
    set encoding=utf-8
    " let $LANG="zh_TW.UTF-8"
    let $LANG="en.UTF-8"
    " set langmenu=none
    " set bomb " write BOM to usc file (not to utf-8 file)
    set termencoding=utf-8
    set fileencoding=utf-8
    set fenc=utf-8
    "set fileencodings=usc-bom,big5,utf-8,latin1
    set fileencodings=utf-8,big5
    "" set guifont=�ө���:h12
    "set guifont=Consolas:h12
else
    echoerr "Sorry, this version of (g)vim was not compiled with multi_byte"
endif

filetype plugin indent on                                                                       
if !exists("autocommands_loaded")
    let autocommands_loaded = 1
    autocmd BufNewFile,BufRead *.vg,*.vi,*.vs,*.vb,*.vh,*.tsk,*.vn,*.sv  :set ft=verilog
    autocmd BufNewFile,BufRead *.do,*.cpf                                :set ft=tcl
    autocmd BufNewFile,BufRead *.hc,*.hm,*.ht,*.hv                       :set ft=c
    autocmd BufNewFile,BufRead *.mem                                     :set ft=hex
    autocmd BufNewFile,BufRead *.syn,*.scr,*.pt,*synopsys*               :set ft=synopsys
    autocmd BufNewFile,BufRead COMMIT_EDITMSG                            :set ft=git 
endif


set number
    if &t_Co > 2 || has("gui_running")
      syntax on
      set hlsearch
    endif
            
    if has("gui_running")
            source $VIMRUNTIME/mswin.vim
            behav mswin
                "set nocompatible
                "source $VIMRUNTIME/vimrc_example.vim
                "source $VIMRUNTIME/mswin.vim
                "behave mswin
            colors fruity
        " For C-A, C-X to increase or decrease
        nunmap <C-A>
    else
                "colors darkblue
                "colors torte
                colors transparent
    endif


set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

    set incsearch
    set nocompatible
    set backspace=indent,eol,start
    set backspace=indent,eol,start
    set autoindent
    set history=50
    set ruler
    set showcmd
    map Q gq
        "        " Use CTRL-Q to do what CTRL-V used to do
        "        noremap <C-Q>      <C-V>

set smarttab expandtab
set tabstop=4 shiftwidth=4
set wildignore=*.o,*.obj,*.bak,*.exe
   
let &titleold=expand("%:t:~") 
" let &titleold=getcwd() " let &titleold=$HOSTNAME
if !has("gui_running")
    set ttymouse=xterm2
    set mouse=a   "will disable copying to clipboard "solution=SHIFT+MOUSE
    set mousemodel=popup
    if $TERM =~ 'screen*'
        set title
        set t_ts=k
        set t_fs=\
        autocmd BufEnter * :set title | let &titlestring = 'vi:' .  expand('%:t:~') . ' | ./' . expand('%:h:~')
        autocmd VimLeave * :set notitle
        set t_AB=[48;5;%dm
        set t_AF=[38;5;%dm
    endif
    " autocmd BufEnter * let &titlestring = "v-" . $HOSTNAME . ":" . expand("%:p:~")
    " autocmd BufEnter * :set title | let &titlestring = "vi:" . expand("%:h:~")
      autocmd BufEnter * :set title | let &titlestring = 'vi:' .  expand('%:t:~') . ' | ./' . expand('%:h:~')
    set title
else
    " autocmd BufEnter * :set title | let &titlestring = "vi:" . expand("%:h:~") 
      autocmd BufEnter * :set title | let &titlestring = expand('%:t:~') . ' | ./' . expand('%:h:~') 
    set title
endif

":set  notitle
set  notitle
set wildmenu
set wildmode=list:longest,full

behav mswin
set matchpairs+=<:>
set matchpairs+==:;
"set matchpairs+=':'
"set matchpairs+=":"

nmap <silent> <F2> <Plug>ToggleProject

set fileencoding=utf-8
set textwidth=0

autocmd FileType make set noexpandtab softtabstop=0 shiftwidth=8
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.tpl      setf html
au VimEnter *.vimp nested Project <afile>|q
au VimEnter *.proj nested Project <afile>|q

"    function! MyTabLabel(n)
"      let buflist = tabpagebuflist(a:n)
"      let winnr = tabpagewinnr(a:n)
"      return bufname(buflist[winnr - 1])
"    endfunctio
"    function! MyTabLine()
"      let s = ''
"      for i in range(tabpagenr('$'))
"        " select the highlighting
"        if i + 1 == tabpagenr()
"          let s .= '%#TabLineSel#'
"        else
"          let s .= '%#TabLine#'
"        endif
"
"        " set the tab page number (for mouse clicks)
"        let s .= '%' . (i + 1) . 'T'
"
"        " the label is made by MyTabLabel()
"        let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
"      endfor
"
"      " after the last tab fill with TabLineFill and reset tab page nr
"      let s .= '%#TabLineFill#%T'
"
"      " right-align the label to close the current tab page
"      if tabpagenr('$') > 1
"        let s .= '%=%#TabLine#%999Xclose'
"      endif
"
"      return s
"    endfunction
"set tabline=%!MyTabLine()

"set tabline=%!MyTabLine()
"
"set showtabline=1 " 2=always
"autocmd GUIEnter * hi! TabLineFill term=underline cterm=underline gui=underline
"autocmd GUIEnter * hi! TabLineSel term=bold,reverse,underline
"\ ctermfg=11 ctermbg=12 guifg=#ffff00 guibg=#0000ff gui=underline

" Tell vim to remember certain things when we exit
"  '10 : marks will be remembered for up to 10 previously edited files
"  "100 : will save up to 100 lines for each register
"  :20 : up to 20 lines of command-line history will be remembered
"  % : saves and restores the buffer list
"  n... : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

"open all fold
set foldlevel=20

" when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
 au!
 autocmd BufReadPost *
 \ if expand("<afile>:p:h") !=? $TEMP |
 \ if line("'\"") > 1 && line("'\"") <= line("$") |
 \ let JumpCursorOnEdit_foo = line("'\"") |
 \ let b:doopenfold = 1 |
 \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
 \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
 \ let b:doopenfold = 2 |
 \ endif |
 \ exe JumpCursorOnEdit_foo |
 \ endif |
 \ endif
 " Need to postpone using "zv" until after reading the modelines.
 autocmd BufWinEnter *
 \ if exists("b:doopenfold") |
 \ exe "normal zv" |
 \ if(b:doopenfold > 1) |
 \ exe "+".1 |
 \ endif |
 \ unlet b:doopenfold |
 \ endif
augroup END


" Really useful " www.vim.org   : Visit frequently
" Really useful " comp.editors  : Vim dominated newsgroup
" Really useful " * # g* g#     : find word under cursor (forwards/backwards)
" Really useful " %             : match brackets {}[]()
" Really useful " matchit.vim   : % now matches tags <tr><td><script> etc
" Really useful " <C-N> <C-P>   : word completion in insert mode
" Really useful " <C-X><C-L>    : Line complete SUPER USEFUL
" Really useful " /<C-R><C-W>   : Pull <cword> onto search/command line
" Really useful " :set ignorecase : you nearly always want this
" Really useful " :set smartcase  : case-sensitive if search contains an uppercase character
set ignorecase smartcase
" Really useful " :syntax on    : colour syntax in Perl,HTML,PHP etc
" Really useful " :h slash<C-D> : type control-D and get a list all help topics containing slash
" Really useful "     (plus use TAB for Help completion)

" [edit] Make it easy to update/reload vimrc
nmap ,s :source $MYVIMRC
nmap ,v :e $MYVIMRC

nmap ,n :tabnext<CR>:<BS>
nmap ,p :tabprev<CR>:<BS>
nmap ,t :tabnew<CR>:<BS>
nmap ,e :NERDTreeToggle<CR>

set kp=~/bin/ydict.pl

