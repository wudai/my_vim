set nu
filetype on
filetype indent on
au BufRead,BufNewFile *.tpl             setfiletype html
syntax on
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set expandtab
set showmatch
set ruler
"set incsearch
set encoding=utf-8
set fileencodings=utf-8
colorscheme desert
set foldmethod=marker
set foldenable
set ignorecase smartcase
set hlsearch
map <F2> ostatic public function ()<CR>{<CR>}<ESC>kkf(i
autocmd FileType php set omnifunc=phpcomplete
au FileType php setlocal dict+=~/.vim/dict/php_funclist.txt
au BufRead,BufNewFile *.php	setlocal dict+=~/.vim/dict/php_funclist.txt
set complete+=k
"
" Tidy-up coding style
"
map ,t :call Tidy()<Cr>

function! Tidy()
	let current_line = line('.')
	if &filetype == "perl"
		let tidy = 'perltidy -pbp -ce'
	elseif &filetype == "php"
		let tidy = 'php_beautifier -t1 -l "ArrayNested() Pear(newline_class=0,newline_function=0) NewLines(after=T_COMMENT:T_DOC_COMMENT,before=switch)"'
	elseif &filetype == "c"
		let tidy = 'indent -orig -i4 -l78 -fca -lc78 -ts4 -br -cdw -nbad -di8 -bap'
	endif
	execute ":0,$!" . tidy
	execute ":" . current_line
endfunction

source ~/.vim/php-doc.vim
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR> 
