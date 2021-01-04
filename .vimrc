" Author: ma6174

" Environment {
    " self-defination {
        if has('macunix')
            let g:zz_platform_mask = 1
        elseif has('unix') && !has('macunix') && !has('win32unix')
            let g:zz_platform_mask = 2
        elseif has('win32') || has('win64')
            let g:zz_platform_mask = 3
        endif
    "}

    " Basics {
        set nocompatible    " 不要使用vi的键盘模,式而是vim自己的, 放在最前面
    " }
" }

" Plugins list{
    if filereadable(expand("~/.vimrc.plug.list"))
        source ~/.vimrc.plug.list
    endif
"}

" General {
    set background=dark

    set encoding=utf-8              " =set enc
    set termencoding=utf-8
    set langmenu=zh_CN.UTF-8
    set fileencoding=utf-8          " =set fenc
    set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp9366  " =set fencs  服务器上中文乱码，set fencs 后 :e重新加载即可
    set helplang=cn

    syntax enable
    syntax on               " 语法高亮

    filetype on             " 侦测文件类型
    filetype plugin on      " 载入文件类型插件
    filetype indent on      " 为特定文件类型载入相关缩进文件

    set autoread            " 设置当文件被改动时自动载入
    set autowrite           "自动保存

    " 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
    "set mouse=a
    "set selection=exclusive
    "set selectmode=mouse,key

    set history=1000        " 历史记录数

    set nobackup
    set noswapfile

    set report=0            " 通过使用:commands命令,告诉我们文件的哪一行被改变过

    set magic               " 设置魔术,正则表达式匹配时. *不用使用转义

    set gdefault            " 行内替换 %s替换的时候本来需要加g选项,才能修改一行中的每一个匹配,设置此选项后加g只匹配第一个，不加g反而匹配每一个

    set completeopt=preview,menu    "代码补全

    set clipboard+=unnamed  "共享剪贴板

    set noeb                " 去掉输入错误的提示声音
    set novisualbell        " 不要闪烁(不明白)
    set completeopt=menu

   " Read last buffer {
       "让vim记忆上次编辑的位置
        autocmd BufReadPost * if line("'\"")>0&&line("'\"")<=line("$") | exe "normal g'\"" | endif
   " }

" }

" VIM UI {
    set showcmd                     " 输入的命令显示出来，看的清楚些
    set showmode
    set autoread

    set cursorline                  " 突出显示当前行
    "set cursorcolumn
    "highlight CursorLine ctermbg=255
    "highlight CursorColumn ctermbg=240
    "autocmd InsertLeave * se nocul  " 关闭插入模式取消浅色高亮当前行
    "autocmd InsertEnter * se cul    " 插入模式下用浅色高亮当前行

    "set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
    set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [ENC=%{&enc}]\ [TYPE=%Y]\ [POS=%l/%L,%v]\ %{strftime(\"%Y-%m-%d\ -\ %H:%M\")}   " 我的状态行显示的内容（包括文件类型和解码）

    set whichwrap+=<,>,h,l          " 光标可以从行首或者行尾跳到另外一行

    set laststatus=2                " 总是显示状态行
    set cmdheight=2                 " 命令行（在状态行下）的高度，默认为1，这里是2

    set foldenable                  " 允许折叠
    set foldmarker={,}
    set foldlevel=1
    set foldmethod=marker
    set foldcolumn=0                " 侧边栏出现n列显示折叠关系

    set wildmode=list:longest,full
    set wildmenu
    set scrolljump=5
    set scrolloff=3                 " 光标移动到buffer的顶部和底部时保持3行距离

    set hlsearch                    "搜索逐字符高亮
    set incsearch                   "输入内容即高亮
    set ignorecase                  "搜索忽略大小写
    "set smartcase                  "增加smartcase,输入的内容全小写，则忽略大小写，如果输入中有大写，不忽略大小写

    set viminfo+=!                  " 保存全局变量
    set iskeyword+=_,$,@,%,#,-      " 带有如下符号的单词不要被换行分割
    set backspace=indent,eol,start  " 同 set backspace = 2 即vim支持删除 indent ， end of line ， start 这三种字符
    set linespace=0                 " 字符间插入的像素行数目
    set number
    "set relativenumber
    set showmatch                   " 高亮显示匹配的括号
    set matchtime=5                 " 匹配括号高亮的时间（单位是十分之一秒）
    set listchars=tab:→\ ,trail:·,extends:↷,precedes:↶
    "set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶    " tab等显示特殊符号

    "显示行尾多余空格
    "highlight ExtraWhitespace ctermbg=red guibg=red
    "autocmd BufWinEnter * match ExtraWhitespace /\s\+$\| \+\ze\t\+\|\t\+\zs \+/

    "80列显示高亮
    set cc=80
    "hi ColorColumn ctermbg=lightcyan  guibg=lightcyan
" }

" Formatting {
    set autoindent      " 自动缩进
    set cindent         " c语言的缩进
    set smartindent

    set expandtab       " 用空格代替制表符
    set tabstop=4       " Tab键的宽度
    set softtabstop=4   " 统一缩进为4
    set shiftwidth=4
    set smarttab        " 在行和段开始处使用制表符
" }

" Key Mapping {
    let mapleader="\<Space>"
    let maplocalleader=","

    " Basic default {
        nnoremap <leader>w :w!<CR>
        nnoremap <leader>q :wq<CR>
        nnoremap <leader>e :w<CR> :e<CR>
        nnoremap <leader>f :find<CR>

        noremap <leader>' :shell<CR>

        "显示不可见字符
        nnoremap <Leader>sl :set list!<CR>

        "加!会自动设置当前相反的设定，减少一个键位映射
        nnoremap <leader>sn :set number!<CR>
        "nnoremap <leader>nn :set nonumber<CR>
        nnoremap <leader>sr :set relativenumber!<CR>
        "nnoremap <leader>nr :set norelativenumber<CR>
        " set paste 可以取消粘贴时自动缩进
        nnoremap <leader>sp :set paste!<CR>

        " 重读配置使修改的配置文件生效
        nnoremap <Leader>sv :source $MYVIMRC<CR>

        " 初始化terminal <version:8.0+>
        nnoremap <Leader>te :below terminal ++rows=10<CR>
    " }

    " Vim Diff {
        " [c 上一个不同处   ]c 下一个不同处
        " merge时上面三个窗口分别是2 ,3 ,4   下面窗口是1
        noremap <silent> <leader>2 :diffget 2<CR> :diffupdate<CR>
        noremap <silent> <leader>3 :diffget 3<CR> :diffupdate<CR>
        noremap <silent> <leader>4 :diffget 4<CR> :diffupdate<CR>
        " p 将本文件中内容放到另外一个文件
        noremap <silent> <leader>p :diffput  <CR> :diffupdate<CR>
        " g 将另外一个文件内容放到本文件中 放在待更新下一行
        noremap <silent> <leader>g :diffget  <CR> :diffupdate<CR>
    " }

    " F- Mapping {
        " 去空行
        "nnoremap <F2> :g/^\s*$/d<CR>
        " 去除行尾空格
        nnoremap <F2> :%s/\s\+$//e<CR>
        " 比较文件
        nnoremap <C-F2> :vert diffsplit

        " 新建标签
        noremap <M-F2> :tabnew<CR>

        " 列出当前目录文件
        noremap <F3> :tabnew .<CR>
        " 打开树状文件目录
        noremap <C-F3> \be

        " 将json格式化
        noremap <F9> :%!python -m json.tool<CR>
        " 打开vimrc
        noremap <F10> :vsp ~/.vimrc<CR>

        noremap <F12> gg=G
    " }

    "Other Mapping {
        " 映射全选+复制 ctrl+a
        " noremap <C-A> ggVGY
        " noremap! <C-A> <Esc>ggVGY

        " 选中状态下 Ctrl+c 复制
        " noremap <C-c> "+y
        "noremap <C-v> "+p      与列编辑冲突
    "}
" }

" Plugins Config {
" must below Key Mapping, conf use <leader>
   if filereadable(expand("~/.vimrc.plug.conf"))
        source ~/.vimrc.plug.conf
    endif
"}

" func 后加!,重新编译vimrc时发现存在同名函数时不报错
" Functions {
    "C，C++ 按F5编译运行 {
        map <F5> :call CompileRunGcc()<CR>

        func! CompileRunGcc()
            exec "w"
            if &filetype == 'c'
                exec "!g++ % -o %<"
                exec "! ./%<"
            elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "! ./%<"
            elseif &filetype == 'java'
                exec "!javac %"
                exec "!java %<"
            elseif &filetype == 'sh'
                :!./%
            endif
        endfunc
    "}

    "C,C++的调试 {
        map <F8> :call Rungdb()<CR>

        func! Rungdb()
            exec "w"
            exec "!g++ % -g -o %<"
            exec "!gdb ./%<"
        endfunc
    "}

    " auto-create_title {
        "新建.c,.h,.sh,.java文件，自动插入文件头
        autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"

        ""定义函数SetTitle，自动插入文件头
        func! SetTitle()
            if &filetype == 'sh'
                call setline(1,"\#########################################################################")
                call append(line("."), "\# File Name: ".expand("%"))
                call append(line(".")+1, "\# Author: zhangzhe")
                call append(line(".")+2, "\# mail: xiaoyiqingz@163.com")
                call append(line(".")+3, "\# Created Time: ".strftime("%c"))
                call append(line(".")+4, "\#########################################################################")
                call append(line(".")+5, "\#!/bin/bash")
                call append(line(".")+6, "")
            else
                call setline(1, "/*************************************************************************")
                call append(line("."), "    > File Name: ".expand("%"))
                call append(line(".")+1, "    > Author: zhangzhe")
                call append(line(".")+2, "    > Mail: xiaoyiqingz@163.com ")
                call append(line(".")+3, "    > Created Time: ".strftime("%c"))
                call append(line(".")+4, " ************************************************************************/")
                call append(line(".")+5, "")
            endif

            if &filetype == 'cpp'
                call append(line(".")+6, "#include<iostream>")
                call append(line(".")+7, "using namespace std;")
                call append(line(".")+8, "")
            endif

            if &filetype == 'c'
                call append(line(".")+6, "#include<stdio.h>")
                call append(line(".")+7, "")
            endif

            "新建文件后，自动定位到文件末尾
            autocmd BufNewFile * normal G

        endfunc
    " }

    " 扩展gf {
        "noremap gf :call ExpandGf()<CR>

        "func! ExpandGf()
        "    " 获取光标下单词
        "    let zz_file = expand("<cword>") . "*"
        "    " 获取 当前文件路径
        "    let zz_path = expand('%:~:h')
        "    let zz_project = ''

        "    while isdirectory(expand(zz_path))
        "        if finddir('.git', zz_path) != ""
        "            let zz_project = zz_path
        "            break
        "        endif
        "        " 获取父目录
        "        let zz_path = fnamemodify(expand(zz_path), ':h')
        "    endwhile

        "    let zz_file_path = system("find " . zz_path . " -name '".zz_file."' ")
        "    if zz_file_path != ""
        "        execute "vsplit " . zz_file_path
        "    elseif
        "        echo 'not find file'
        "    endif

        "endfunction
    "}

    " Auto complete {
    "    "自动补全 {
    "    :inoremap ( ()<ESC>i
    "    :inoremap ) <c-r>=ClosePair(')')<CR>
    "    :inoremap { {<CR>}<ESC>O
    "    :inoremap } <c-r>=ClosePair('}')<CR>
    "    :inoremap [ []<ESC>i
    "    :inoremap ] <c-r>=ClosePair(']')<CR>
    "    :inoremap " ""<ESC>i
    "    :inoremap ' ''<ESC>i

    "    function! ClosePair(char)
    "        if getline('.')[col('.') - 1] == a:char
    "            return "\<Right>"
    "        else
    "            return a:char
    "        endif
    "    endfunction
    " }
"}

" GUI Settings {
    if has("gui_running")
        " 解决菜单栏乱码
        let $LANG = 'zh_CN.UTF-8'
        set langmenu=zh_CN
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
        set guioptions-=r       " 隐藏右侧滚动条
        set guioptions-=L       " 隐藏左侧滚动条
        set guioptions-=T       " 隐藏工具栏
        set guioptions-=e
        set guioptions-=m       " 隐藏菜单栏
        set shortmess+=c
        " No annoying sound on errors
        set noerrorbells
        set novisualbell
        set t_vb=
        " windows GUI界面乱码设置
        if WINDOWS() && has("gui_running")
            "处理consle输出乱码
            language messages zh_CN.utf-8
            " Set extra options when running in GUI mode
            set guifont=Consolas:h13
            " set guifont＝Source\ Code\ Pro\ for\ Powerline
            if has("gui_gtk2")   "GTK2
                set guifont=Monaco\ 12,Monospace\ 12
            endif
            set guitablabel=%M\ %t
            " set showtabline=1
            " set guioptions+=e   "
            " 这两个设置会使得airline上方的buffer无法显示
            set linespace=2
            set noimd
        elseif OSX() && has("gui_running")
            " set guifont=Cousine\ for\ Powerline:h13
            set guifont=Roboto\ Mono\ Light\ for\ Powerline:h13
            set lines=100 columns=90
            " GUI 最大化快捷键
            nnoremap <Leader>wm :call FullScreenToggle()<CR>
        endif
    endif
"}

" Other Or Not Used {
    " quickfix模式
    autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>

    "make 运行
    :set makeprg=g++\ -Wall\ \ %

    " 在被分割的窗口间显示空白，便于阅读
    set fillchars=vert:\ ,stl:\ ,stlnc:\ ,fold:-

    " 高亮显示普通txt文件（需要txt.vim脚本）
    au BufRead,BufNewFile *  setfiletype txt

    " ctages {
        "设置tags, exuberant-ctags 比ctags好用
        "设置使用当前目录的tags,必须加;
        set tags=tags;
        "如果当前目录没有tags文件,到父目录查找
        set autochdir
    " }
"}

" minibufexplorer {
    "现在是默认安装的插件
    ":e <filename> 打开文件
    ":ls    当前打开的buf
    ":bn    下一个buf
    ":bp    前一个buf
    ":b<n>    n是数字，第n个buf
    ":b<tab>    自动补齐
    ":bd    删除buf

    let g:miniBufExplMapWindowNavVim = 1
    let g:miniBufExplMapWindowNavArrows = 1
    let g:miniBufExplMapCTabSwitchBufs = 1
    let g:miniBufExplModSelTarget = 1
" }

" mac下文件转码
" -f是现在的格式
" -t是目标格式
" Desktop/from.txt 是输入文件
" to.txt是目标文件
"iconv -f UTF-8 -t GBK Desktop/from.txt > to.txt
