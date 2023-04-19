set backspace=indent,eol,start
syntax on
set number
set ts=4
set sts=4
set et
vnoremap <C-c> "*y
nnoremap <C-p> "*p
inoremap <C-p> <C-R>*
nnoremap <C-a> ggVG"*y<C-O>
vnoremap <leader>c "*y
nnoremap <leader>v "*p
inoremap <leader>v <C-R>*
nnoremap <leader>a ggVG"*y<C-O>

