" Vim syntax file

" Based on the vim help syntax
if has("ebcdic")
  syn match vimHelpHyperTextJump	"\\\@<!|[^"*|]\+|" contains=vimHelpBar
  syn match vimHelpHyperTextEntry	"\*[^"*|]\+\*\s"he=e-1 contains=vimHelpStar
  syn match vimHelpHyperTextEntry	"\*[^"*|]\+\*$" contains=vimHelpStar
else
  syn match vimHelpHyperTextJump	"\\\@<!|[#-)!+-~]\+|" contains=vimHelpBar
  syn match vimHelpHyperTextEntry	"\*[#-)!+-~]\+\*\s"he=e-1 contains=vimHelpStar
  syn match vimHelpHyperTextEntry	"\*[#-)!+-~]\+\*$" contains=vimHelpStar
endif
syn match vimHelpBar		contained "|" conceal
syn match vimHelpStar		contained "\*" conceal

syn cluster vimCommentGroup	contains=vimHelpHyperTextJump,vimHelpHyperTextEntry

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link vimHelpHyperTextJump	Subtitle
hi def link vimHelpBar		Ignore
hi def link vimHelpStar		Ignore
hi def link vimHelpHyperTextEntry	String
hi def link Subtitle		Identifier
