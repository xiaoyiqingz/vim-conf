### vim config

#### 2016-11-22
* add vimrc to git

#### 2016-11-23
* modify vimrc format(from space-vim) and remove duplited settings
* add .vimrc.plug.list & .vimrc.plug.conf

* 在服务器端不能正常显示256色  
> 在.bashrc中添加 TERM=xterm-256color  
> 在.tmux.conf中 set -g default-terminal "screen-256color"  

#### 2016-11-28
* add YouCompleteMe  

* fixed mac ctags problem      
> mac 默认的ctags功能简单，且ycm不支持它生成的tags，需要安装Exuberant Ctags(brew install ctags-exuberant)  
> 生成的tags加--fields=+l选项,否则不能识别(YCM docs 中 because YCM needs the `'language:<lang>'` field in the tags output)  

#### 2016-12-05
* vim-trailing-whitespace `let g:extra_whitespace_ignored_filetypes = ['markdown']`在md文件中不显示空白字符
* ctrlsf 设置工程目录为搜索路径，并添加忽略路径
```
    let g:ctrlsf_default_root = 'project'
    let g:ctrlsf_ignore_dir = ['public', 'vendor', 'bootstrap', 'tests', 'tags']
```

#### 2016-12-06
*  set gdefault 行内替换 %s替换的时候本来需要加g选项,才能修改一行中的每一个匹配,设置此选项后加g只匹配第一个，不加g反而匹配每一个

#### 2016-12-10
* 解决由于设置了 `autocmd InsertLeave * se nocul` 导致退出插入模式后光标所在行高亮失效的问题

#### 2016-12-11
* add vim startify
* `nnoremap <leader>sn :set number` and `nnoremap <leader>nn :set nonumber` 修改为 `nnoremap <leader>sn :set number?` 这样只需要一个映射就可以实现切换
* 将所有映射改为非递归映射 map->noremap

#### 2016-12-13
* func 后加!，重新编译vimrc时遇到存在的函数不会报错
* add self define var zz_platform_mask to set some different conf 

#### 2017-03-09
* implemet my gf function

---
参考:
* [ma6174/vim](https://github.com/ma6174/vim)
* [space-vim](https://github.com/liuchengxu/space-vim)
