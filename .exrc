if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <Plug>ZenCodingAnchorizeSummary :call zencoding#anchorizeURL(1)a
inoremap <Plug>ZenCodingAnchorizeURL :call zencoding#anchorizeURL(0)a
inoremap <Plug>ZenCodingRemoveTag :call zencoding#removeTag()a
inoremap <Plug>ZenCodingSplitJoinTagInsert :call zencoding#splitJoinTag()
inoremap <Plug>ZenCodingToggleComment :call zencoding#toggleComment()a
inoremap <Plug>ZenCodingImageSize :call zencoding#imageSize()a
inoremap <Plug>ZenCodingPrev :call zencoding#moveNextPrev(1)
inoremap <Plug>ZenCodingNext :call zencoding#moveNextPrev(0)
inoremap <Plug>ZenCodingBalanceTagOutwardInsert :call zencoding#balanceTag(-1)
inoremap <Plug>ZenCodingBalanceTagInwardInsert :call zencoding#balanceTag(1)
inoremap <Plug>ZenCodingExpandWord u:call zencoding#expandAbbr(1,"")a
inoremap <Plug>ZenCodingExpandAbbr u:call zencoding#expandAbbr(0,"")a
inoremap <S-Tab> 
imap <F3>  :NERDTreeToggle
map  ggVG$"+y
vmap  "+y
map  w
vmap c <Plug>ZenCodingCodePretty
nmap A <Plug>ZenCodingAnchorizeSummary
nmap a <Plug>ZenCodingAnchorizeURL
nmap k <Plug>ZenCodingRemoveTag
nmap j <Plug>ZenCodingSplitJoinTagNormal
vmap m <Plug>ZenCodingMergeLines
nmap / <Plug>ZenCodingToggleComment
nmap i <Plug>ZenCodingImageSize
nmap N <Plug>ZenCodingPrev
nmap n <Plug>ZenCodingNext
vmap D <Plug>ZenCodingBalanceTagOutwardVisual
nmap D <Plug>ZenCodingBalanceTagOutwardNormal
vmap d <Plug>ZenCodingBalanceTagInwardVisual
nmap d <Plug>ZenCodingBalanceTagInwardNormal
nmap , <Plug>ZenCodingExpandNormal
vmap , <Plug>ZenCodingExpandVisual
map  :w
nmap d :cs find d =expand("<cword>")	
nmap i :cs find i ^=expand("<cfile>")$
nmap f :cs find f =expand("<cfile>")	
nmap e :cs find e =expand("<cword>")	
nmap t :cs find t =expand("<cword>")	
nmap c :cs find c =expand("<cword>")	
nmap g :cs find g =expand("<cword>")	
nmap s :cs find s =expand("<cword>")	
nmap <silent> # <Plug>MarkSearchPrev
nmap <silent> * <Plug>MarkSearchNext
map \T <Plug>TaskList
nmap <silent> \? <Plug>MarkSearchAnyPrev
nmap <silent> \/ <Plug>MarkSearchAnyNext
nmap <silent> \# <Plug>MarkSearchCurrentPrev
nmap <silent> \* <Plug>MarkSearchCurrentNext
nmap <silent> \n <Plug>MarkClear
xmap <silent> \r <Plug>MarkRegex
nmap <silent> \r <Plug>MarkRegex
xmap <silent> \m <Plug>MarkSet
nmap <silent> \m <Plug>MarkSet
nmap \caL <Plug>CalendarH
nmap \cal <Plug>CalendarV
vmap \ \cc
nmap \ \cc
vmap ]f :call PythonDec("function", 1)
nmap ]f :call PythonDec("function", 1)
omap ]f :call PythonDec("function", 1)
vmap ]F :call PythonDec("function", -1)
nmap ]F :call PythonDec("function", -1)
omap ]F :call PythonDec("function", -1)
vmap ]j :call PythonDec("class", 1)
nmap ]j :call PythonDec("class", 1)
omap ]j :call PythonDec("class", 1)
vmap ]J :call PythonDec("class", -1)
nmap ]J :call PythonDec("class", -1)
omap ]J :call PythonDec("class", -1)
map ]<Down> :call PythonNextLine(1)
map ]<Up> :call PythonNextLine(-1)
map ]d :call PythonSelectObject("function")
map ]c :call PythonSelectObject("class")
vmap ]u :call PythonUncommentSelection()
nmap ]u :call PythonUncommentSelection()
omap ]u :call PythonUncommentSelection()
vmap ]# :call PythonCommentSelection()
nmap ]# :call PythonCommentSelection()
omap ]# :call PythonCommentSelection()
vmap ]> >
nmap ]> ]tV]e>
omap ]> ]tV]e>
vmap ]< <
nmap ]< ]tV]e<
omap ]< ]tV]e<
map ]v ]tV]e
vmap ]e :PEoBm'gv``
nmap ]e :PEoB
omap ]e :PEoB
vmap ]t :PBOBm'gv``
nmap ]t :PBoB
omap ]t :PBoB
nmap fi :!firefox %.html & 
nmap gx <Plug>NetrwBrowseX
nmap md :!~/.vim/markdown.pl % > %.html 
nmap tl :Tlist
nmap tt :%s/\t/    /g
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
vnoremap <Plug>ZenCodingCodePretty :call zencoding#codePretty()
nnoremap <Plug>ZenCodingAnchorizeSummary :call zencoding#anchorizeURL(1)
nnoremap <Plug>ZenCodingAnchorizeURL :call zencoding#anchorizeURL(0)
nnoremap <Plug>ZenCodingRemoveTag :call zencoding#removeTag()
nnoremap <Plug>ZenCodingSplitJoinTagNormal :call zencoding#splitJoinTag()
vnoremap <Plug>ZenCodingMergeLines :call zencoding#mergeLines()
nnoremap <Plug>ZenCodingToggleComment :call zencoding#toggleComment()
nnoremap <Plug>ZenCodingImageSize :call zencoding#imageSize()
nnoremap <Plug>ZenCodingPrev :call zencoding#moveNextPrev(1)
nnoremap <Plug>ZenCodingNext :call zencoding#moveNextPrev(0)
vnoremap <Plug>ZenCodingBalanceTagOutwardVisual :call zencoding#balanceTag(-2)
nnoremap <Plug>ZenCodingBalanceTagOutwardNormal :call zencoding#balanceTag(-1)
vnoremap <Plug>ZenCodingBalanceTagInwardVisual :call zencoding#balanceTag(2)
nnoremap <Plug>ZenCodingBalanceTagInwardNormal :call zencoding#balanceTag(1)
nnoremap <Plug>ZenCodingExpandWord :call zencoding#expandAbbr(1,"")
nnoremap <Plug>ZenCodingExpandNormal :call zencoding#expandAbbr(3,"")
vnoremap <Plug>ZenCodingExpandVisual :call zencoding#expandAbbr(2,"")
nnoremap <silent> <Plug>MarkSearchPrev :if !mark#SearchNext(1)|execute 'normal! #zv'|endif
nnoremap <silent> <Plug>MarkSearchNext :if !mark#SearchNext(0)|execute 'normal! *zv'|endif
nnoremap <silent> <Plug>MarkSearchAnyPrev :call mark#SearchAnyMark(1)
nnoremap <silent> <Plug>MarkSearchAnyNext :call mark#SearchAnyMark(0)
nnoremap <silent> <Plug>MarkSearchCurrentPrev :call mark#SearchCurrentMark(1)
nnoremap <silent> <Plug>MarkSearchCurrentNext :call mark#SearchCurrentMark(0)
nnoremap <silent> <Plug>MarkToggle :call mark#Toggle()
nnoremap <silent> <Plug>MarkAllClear :call mark#ClearAll()
nnoremap <silent> <Plug>MarkClear :if !mark#DoMark(v:count, (v:count ? '' : mark#CurrentMark()[0]))|execute "normal! \<C-\>\<C-n>\<Esc>"|endif
vnoremap <silent> <Plug>MarkRegex :call mark#MarkRegex(mark#GetVisualSelectionAsRegexp())
nnoremap <silent> <Plug>MarkRegex :call mark#MarkRegex('')
vnoremap <silent> <Plug>MarkSet :if !mark#DoMark(v:count, mark#GetVisualSelectionAsLiteralPattern())|execute "normal! \<C-\>\<C-n>\<Esc>"|endif
nnoremap <silent> <Plug>MarkSet :if !mark#MarkCurrentWord(v:count)|execute "normal! \<C-\>\<C-n>\<Esc>"|endif
nmap <Nul><Nul>d :vert scs find d =expand("<cword>")
nmap <Nul><Nul>i :vert scs find i ^=expand("<cfile>")$	
nmap <Nul><Nul>f :vert scs find f =expand("<cfile>")	
nmap <Nul><Nul>e :vert scs find e =expand("<cword>")
nmap <Nul><Nul>t :vert scs find t =expand("<cword>")
nmap <Nul><Nul>c :vert scs find c =expand("<cword>")
nmap <Nul><Nul>g :vert scs find g =expand("<cword>")
nmap <Nul><Nul>s :vert scs find s =expand("<cword>")
nmap <Nul>d :scs find d =expand("<cword>")	
nmap <Nul>i :scs find i ^=expand("<cfile>")$	
nmap <Nul>f :scs find f =expand("<cfile>")	
nmap <Nul>e :scs find e =expand("<cword>")	
nmap <Nul>t :scs find t =expand("<cword>")	
nmap <Nul>c :scs find c =expand("<cword>")	
nmap <Nul>g :scs find g =expand("<cword>")	
nmap <Nul>s :scs find s =expand("<cword>")	
nnoremap <silent> <F11> :call conque_term#exec_file()
nnoremap <silent> <Plug>CalendarH :cal Calendar(1)
nnoremap <silent> <Plug>CalendarV :cal Calendar(0)
map <F6> :call FormartSrc()
map <F8> :call Rungdb()
map <F5> :call CompileRunGcc()
map <C-F3> \be  
map <F3> :NERDTreeToggle
nnoremap <C-F2> :vert diffsplit 
nnoremap <F2> :g/^\s*$/d 
map <F12> gg=G
map <S-Right> :tabn
map <S-Left> :tabp
nmap <silent> <F9> :Tlist
imap  ^
imap  $
imap 	 
imap <NL> 
imap  ,
map!  ,
imap  	
imap  "*pa
imap  =CtrlXPP()
imap A <Plug>ZenCodingAnchorizeSummary
imap a <Plug>ZenCodingAnchorizeURL
imap k <Plug>ZenCodingRemoveTag
imap j <Plug>ZenCodingSplitJoinTagInsert
imap / <Plug>ZenCodingToggleComment
imap i <Plug>ZenCodingImageSize
imap N <Plug>ZenCodingPrev
imap n <Plug>ZenCodingNext
imap D <Plug>ZenCodingBalanceTagOutwardInsert
imap d <Plug>ZenCodingBalanceTagInwardInsert
imap ; <Plug>ZenCodingExpandWord
imap , <Plug>ZenCodingExpandAbbr
map!  zzi
let &cpo=s:cpo_save
unlet s:cpo_save
set ambiwidth=double
set autochdir
set autoindent
set autoread
set autowrite
set background=dark
set backspace=2
set balloonexpr=SyntasticBalloonsExprNotifier()
set cindent
set cmdheight=2
set completeopt=longest,menu
set confirm
set cscopetag
set cscopeverbose
set expandtab
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030
set fillchars=vert:\ ,stl:\ ,stlnc:\\
set guioptions=
set helplang=cn
set hlsearch
set ignorecase
set incsearch
set iskeyword=@,48-57,_,192-255,.
set langmenu=zh_CN.UTF-8
set laststatus=2
set matchtime=1
set mouse=a
set mousemodel=popup
set printoptions=paper:a4
set report=0
set ruler
set runtimepath=~/.vim,~/.vim/bundle/vundle,~/.vim/bundle/vim-fugitive,~/.vim/bundle/sparkup/vim/,~/.vim/bundle/indentLine,~/.vim/bundle/L9,~/.vim/bundle/FuzzyFinder,~/.vim/bundle/command-t,~/.vim/bundle/Auto-Pairs,~/.vim/bundle/python-imports.vim,~/.vim/bundle/CaptureClipboard,~/.vim/bundle/ctrlp-modified.vim,~/.vim/bundle/last_edit_marker.vim,~/.vim/bundle/synmark.vim,~/.vim/bundle/SQLComplete.vim,~/.vim/bundle/Javascript-OmniCompletion-with-YUI-and-j,~/.vim/bundle/jslint.vim,~/.vim/bundle/vim-javascript,~/.vim/bundle/Vim-Script-Updater,~/.vim/bundle/ctrlp.vim,~/.vim/bundle/ctrlp-funky,~/.vim/bundle/jsbeautify,~/.vim/bundle/The-NERD-Commenter,~/.vim/bundle/django_templates.vim,~/.vim/bundle/Django-Projects,~/.vim/bundle/Auto-Pairs,~/.vim/bundle/Better-Javascript-Indentation,~/.vim/bundle/CaptureClipboard,~/.vim/bundle/Django-Projects,~/.vim/bundle/FuzzyFinder,~/.vim/bundle/JavaScript-Indent,~/.vim/bundle/Javascript-Indentation,~/.vim/bundle/Javascript-OmniCompletion-with-YUI-and-j,~/.vim/bundle/L9,~/.vim/bundle/OOP-javascript-indentation,~/.vim/bundle/PHP-correct-Indenting,~/.vim/bundle/SQLComplete.vim,~/.vim/bundle/The-NERD-Commenter,~/.vim/bundle/Vim-Script-Updater,~/.vim/bundle/command-t,~/.vim/bundle/ctrlp-funky,~/.vim/bundle/ctrlp-modified.vim,~/.vim/bundle/ctrlp.vim,~/.vim/bundle/django_templates.vim,~/.vim/bundle/indentLine,~/.vim/bundle/javascript.vim,~/.vim/bundle/jsbeautify,~/.vim/bundle/jslint.vim,~/.vim/bundle/last_edit_marker.vim,~/.vim/bundle/php.vim,~/.vim/bundle/php.vim-for-php5,~/.vim/bundle/php_funcinfo.vim,~/.vim/bundle/phpcomplete.vim,~/.vim/bundle/phpcs.vim,~/.vim/bundle/python-imports.vim,~/.vim/bundle/sparkup,~/.vim/bundle/synmark.vim,~/.vim/bundle/syntastic,~/.vim/bundle/vim-easymotion,~/.vim/bundle/vim-fugitive,~/.vim/bundle/vim-indent-guides,~/.vim/bundle/vim-javascript,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after,$GOROOT/misc/vim,~/.vim/bundle/vundle/,~/.vim/bundle/vundle/after,~/.vim/bundle/vim-fugitive/after,~/.vim/bundle/sparkup/vim//after,~/.vim/bundle/indentLine/after,~/.vim/bundle/L9/after,~/.vim/bundle/FuzzyFinder/after,~/.vim/bundle/command-t/after,~/.vim/bundle/Auto-Pairs/after,~/.vim/bundle/python-imports.vim/after,~/.vim/bundle/CaptureClipboard/after,~/.vim/bundle/ctrlp-modified.vim/after,~/.vim/bundle/last_edit_marker.vim/after,~/.vim/bundle/synmark.vim/after,~/.vim/bundle/SQLComplete.vim/after,~/.vim/bundle/Javascript-OmniCompletion-with-YUI-and-j/after,~/.vim/bundle/jslint.vim/after,~/.vim/bundle/vim-javascript/after,~/.vim/bundle/Vim-Script-Updater/after,~/.vim/bundle/ctrlp.vim/after,~/.vim/bundle/ctrlp-funky/after,~/.vim/bundle/jsbeautify/after,~/.vim/bundle/The-NERD-Commenter/after,~/.vim/bundle/django_templates.vim/after,~/.vim/bundle/Django-Projects/after
set scrolloff=3
set selection=exclusive
set selectmode=mouse,key
set shiftwidth=4
set showmatch
set smartindent
set smarttab
set softtabstop=4
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set noswapfile
set tabstop=4
set tags=tags;
set termencoding=utf-8
set whichwrap=b,s,<,>,h,l
set wildignore=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif,*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc,*.png,*.jpg,*.gif
set wildmenu
" vim: set ft=vim :
