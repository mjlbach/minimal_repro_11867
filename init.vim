let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'neovim/nvim-lspconfig'
call plug#end()

lua << EOF
require('lspconfig').clangd.setup {
  cmd = { 'clangd', '--background-index' },
  flags = { debounce_text_changes = 150, }
}
EOF
