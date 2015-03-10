syntax on
set bg=dark
set timeoutlen=200
map ; :
command Openscad execute "! openscad % &"
set ai
set cindent
set shiftwidth=4
set expandtab
:nnoremap <F8> :setl noai nocindent nosiftwidth noexpandtab inde=<CR>
:nnoremap <F9> :setl ai cindent shiftwidth=2 expandtab
