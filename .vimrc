" Wrap at 72 chars for commit messages
autocmd FileType gitcommit setlocal textwidth=72
" Optionally, highlight the first 50 chars (subject line)
autocmd FileType gitcommit setlocal colorcolumn=50
set number 
set numberwidth=1
set clipboard=unnamed

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'

call plug#end()
