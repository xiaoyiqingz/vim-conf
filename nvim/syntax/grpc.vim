if exists("b:current_syntax")
  finish
endif

syn keyword grpcKeyword grpc rpc service message required optional repeated oneof map
syn keyword grpcString --plaintext
syn match grpcStatement /[[a-zA-Z0-9_]*]/
syn match grpcType /\<[A-Z]\w*\>/
syn match grpcComment /\/\/.*/
syn region grpcString start=+"+ end=+"+ contains=grpcEscape
syn match grpcEscape +\\[abfnrtv"\']+ contained

hi def link grpcKeyword Keyword
hi def link grpcStatement Statement
hi def link grpcType Type
hi def link grpcComment Comment
hi def link grpcString String
hi def link grpcEscape Special
