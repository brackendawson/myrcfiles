syntax on
set bg=dark
set timeoutlen=200
map ; :
set ai
set shiftwidth=4
:nnoremap <F8> :setl noai nocindent shiftwidth=0 noexpandtab inde=<CR>
:nnoremap <F9> :setl ai cindent shiftwidth=4 expandtab
