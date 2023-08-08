set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.config/nvim/vimrc/.vimrc

" use nvim-tree instead netrw
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

lua require('plugins')

autocmd BufNewFile,BufRead *.api set filetype=ebnf
autocmd BufNewFile,BufRead *.grpc set filetype=grpc
autocmd BufNewFile,BufRead *.http set filetype=http
autocmd BufNewFile,BufRead *.http TSBufToggle highlight

" rest-nvim {
    command! Http lua require('rest-nvim').run()
    nmap <leader>hh <Plug>RestNvim
" }

" copilot {
    let g:copilot_filetypes = {
      \ 'markdown': 1,
      \ }
" }

" nvim-tree {
    command! Nt : NvimTreeToggle
" }

function! CreateFileWithCurrentDate()
    execute "cd ~/Desktop/dd/note/"
    let date = strftime('%Y-%m-%d')
    let filename = date . '.txt'
    execute 'e ' . filename
endfunction

command! Df call CreateFileWithCurrentDate()

nmap <silent> gx :!open <cword><cr>
