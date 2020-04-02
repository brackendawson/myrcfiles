syntax on
set bg=dark
set timeoutlen=200
map ; :
set ai
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4
set listchars=tab:→ 
set list
match Error /\s\+$/
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

"For terrible, terrible python
:nnoremap <F7> :set noexpandtab noexpandtab shiftwidth=8 softtabstop=8<CR>
