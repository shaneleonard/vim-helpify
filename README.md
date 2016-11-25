Vim Helpify
===========

This plugin allows you to use any file like a vim help-doc. Add help-doc style tags 
and jump to them using the `:help` command from any file, or with `:tag` when the file
is being edited.

Configuration is straightforward--simply set
`g:vim_helpify_files` to a list of the files you want tagged. vim will remember
these files and regenerate the tags when any of them are written.

The plugin also comes with syntax highlighting for vim script files, allowing
you to see the tags with the same coloring as the real vim help docs.

Usage
-----

Add tags to your file using the `|my-tag|` and `*my-tag*` syntax. In your vimrc, add the
file path to the `g:vim_helpify_files` list. After reloading your vimrc and writing the file,
the help tags will be generated. They can then be searched using `:help <tagname>`.
