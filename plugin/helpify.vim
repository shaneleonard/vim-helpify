if !exists("g:vim_helpify_tags_dir")
    let g:vim_helpify_tags_dir = "~/.vim/bundle/vim-helpify/tags/"
endif


if !exists("g:vim_helpify_files")
    let g:vim_helpify_files = []
endif

if !exists("*mkdir")
    echom "Vim-Helpify: Error: This version of vim is missing support for mkdir." 
    finish
endif

if !exists("*sha256")
    echom "Vim-Helpify: Error: Vim must be compiled with +cryptv feature."
    finish
endif

let g:vim_helpify_tags_dir = expand(g:vim_helpify_tags_dir, ":p")

if !isdirectory(g:vim_helpify_tags_dir)
    echom "Creating directory " . g:vim_helpify_tags_dir . " for vim-helpify tags."
    call mkdir(g:vim_helpify_tags_dir, "p")
endif

" Empty the tags directory 
call system("rm -f " . g:vim_helpify_tags_dir . "*")

function! s:HelpifyLink(filename)
    return sha256(expand(a:filename, ":p"))[0:7] . ".txt"
endfunction

execute "augroup vim_helpify_reload_tags"
execute "au!"

for helpify_file in g:vim_helpify_files
    let helpify_file = expand(helpify_file, ":p")
    if !filereadable(helpify_file)
        continue
    endif

    let helpify_link = g:vim_helpify_tags_dir . s:HelpifyLink(helpify_file)

    if !filereadable(helpify_link)
        call system("ln -s " . helpify_file . " " . helpify_link)
        if v:shell_error
            echom "Error creating symlink " . helpify_link . " to file " . helpify_file
        endif
    endif

    execute "autocmd! BufWritePost " . helpify_file . " :helptags " . g:vim_helpify_tags_dir
    execute "autocmd! BufWinEnter " . helpify_file . " :setlocal tags+=" . g:vim_helpify_tags_dir . "tags"

endfor

execute "augroup END"

execute ":helptags " . g:vim_helpify_tags_dir
