vim.cmd([[
syntax match delimiter_skk '\/'
syntax match midasi_skk '\v^\S+ @=' contains=okuri_midasi_skk,anyNumber_midasi_skk
    syntax match okuri_midasi_skk '\v(^[ぁ-んー]+)@<=\l' contained
    syntax match anyNumber_midasi_skk '#' contained
syntax match kouho_skk '\v\/@<=[^/]+' contains=annotation_kouho_skk,numberFormat_kouho_skk,lisp_kouho_skk
    syntax match annotation_kouho_skk '\v;[^/]+' contained contains=lisp_kouho_skk
    syntax match numberFormat_kouho_skk '\v#\d' contained containedin=ALL
    syntax match lisp_kouho_skk '\v[/;]@<=\([a-z-]+ [^/]+\)[/;]@=' contained contains=bracket_lisp_kouho_skk,identifier_lisp_kouho_skk,string_lisp_kouho_skk,number_lisp_kouho_skk,symbol_lisp_kouho_skk
        syntax match bracket_lisp_kouho_skk '\v[()]' contained
        syntax match identifier_lisp_kouho_skk '\v[^ ()]+' contained
            syntax match function_lisp_kouho_skk '\v\(@<=[^ ()]+' contained containedin=identifier_lisp_kouho_skk
        syntax match string_lisp_kouho_skk '\v".{-}"' contained contains=dateFormat_string_lisp_kouho_skk,escape_string_lisp_kouho_skk
            syntax match dateFormat_string_lisp_kouho_skk '\v\%\a' contained
            syntax match escape_string_lisp_kouho_skk '\v\\\d{3}' contained
        syntax match number_lisp_kouho_skk '\v-?\d' contained
        syntax match symbol_lisp_kouho_skk '\v\'\a+' contained

syntax match invalidExpression_skk '\v^(\S+ \/.+\/$)@!.+'
syntax match tooManySemicolons_kouho_skk '\v(\/.{-})@<=(;[^/]*){2,}\/@=' contained containedin=kouho_skk
syntax match allowedOnlyInUserdict_kouho_skk '\v\/@<=\[.\/.{-}\/]\/' contained containedin=kouho_skk
syntax match unnecessaryOkuri_kouho_skk '\v(^[あ-んー]+\l .*\/[^/;]+)@<=[あ-ん][/;]@=' contained containedin=kouho_skk

syntax match comment_skk '\v^;.+' contained containedin=invalidExpression_skk
syntax match okuriComment_skk '\v^;; okuri-(ari|nasi) entries\.$'
]])

-- highlight
vim.api.nvim_set_hl(0,'delimiter_skk',{link = '@punctuation.delimiter'})
vim.api.nvim_set_hl(0,'midasi_skk',{link = '@property'})
    vim.api.nvim_set_hl(0,'okuri_midasi_skk',{link = '@keyword'})
    vim.api.nvim_set_hl(0,'anyNumber_midasi_skk',{link = '@variable.parameter'})
vim.api.nvim_set_hl(0,'kouho_skk',{link = 'string'})
    vim.api.nvim_set_hl(0,'annotation_kouho_skk',{link = 'comment'})
    vim.api.nvim_set_hl(0,'numberFormat_kouho_skk',{link = 'anyNumber_midasi_skk'})
    vim.api.nvim_set_hl(0,'unnecessaryOkuri_kouho_skk',{link = 'error'})
    vim.api.nvim_set_hl(0,'lisp_kouho_skk',{})
        vim.api.nvim_set_hl(0,'identifier_lisp_kouho_skk',{link = '@variable'})
        vim.api.nvim_set_hl(0,'function_lisp_kouho_skk',{link = 'function'})
        vim.api.nvim_set_hl(0,'string_lisp_kouho_skk',{link = 'string'})
            vim.api.nvim_set_hl(0,'dateFormat_string_lisp_kouho_skk',{link = '@string.escape'})
            vim.api.nvim_set_hl(0,'escape_string_lisp_kouho_skk',{link = '@string.escape'})
        vim.api.nvim_set_hl(0,'number_lisp_kouho_skk',{link = 'number'})
        vim.api.nvim_set_hl(0,'symbol_lisp_kouho_skk',{link = 'special'})
        vim.api.nvim_set_hl(0,'bracket_lisp_kouho_skk',{link = '@punctuation.bracket'})

vim.api.nvim_set_hl(0,'invalidExpression_skk',{link = 'error'})
vim.api.nvim_set_hl(0,'tooManySemicolons_kouho_skk',{link = 'error'})
vim.api.nvim_set_hl(0,'allowedOnlyInUserdict_kouho_skk',{link = 'error'})

vim.api.nvim_set_hl(0,'comment_skk',{link = 'comment'})
vim.api.nvim_set_hl(0,'okuriComment_skk',{link = 'statement'})
