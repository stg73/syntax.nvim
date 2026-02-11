-- very magicのハイライト
vim.cmd([=[
syntax match literal_regex '\v.'
syntax match ignored_regex '\v\/'
syntax match number_regex '\v\d' contained
syntax match escape_regex '\v\\.'
syntax match flag_regex '\v\\([cCZmMvV]|\%\#\=\d)'
syntax match characterClasses_regex '\v\\_?[iIkKfFpPsSdDxXoOwWhHaAlLuU]'
syntax match malti_regex '\v[*+?=]|\{.{-}\}|\@[><]|\@[><]?[!=]' contains=number_regex,delimiter_malti_regex
    syntax match delimiter_malti_regex ','
syntax match patternAtom_regex "\v(\\_)?[$^.]|[><]|\\z[se]|\%[<>]?([$^V#]|'\l|(\.|\d)+[lcv])" contains=number_regex
syntax match delimiter_regex '\v[&|]'
syntax match matomeru_regex '\v[)(]'
syntax match characterClasses_regex '\v(\\_)?\[([^\\\]]|\\.)+\]' contains=literal_characterClasses_regex
    syntax match literal_characterClasses_regex '\v\[@<=.{-}\]@=' contained contains=hanni_characterClasses_regex,negation_characterClasses_regex,escape_regex
        syntax match hanni_characterClasses_regex '\v.-[^\]]' contained
        syntax match delimiter_hanni_characterClasses_regex '\v.@<=-.@=' contained containedin=hanni_characterClasses_regex
        syntax match negation_characterClasses_regex '\v\[@<=\^' contained
syntax match ui2cmdline_regex '\v^[/?]'
]=])

-- very nomagicのハイライト
vim.cmd([[
syntax match Vregex '\v\\V.+' contains=ALLBUT,malti_regex,patternAtom_regex,delimiter_regex,matomeru_regex,characterClasses_regex,number_regex,negation_characterClasses_regex,literal_characterClasses_regex,hanni_characterClasses_regex,delimiter_hanni_characterClasses_regex
syntax match malti_regex '\v\\([*+?=]|\{.{-}\}|\@[><]?[!=]?)' contained containedin=Vregex contains=number_regex,delimiter_malti_regex
syntax match patternAtom_regex "\v\\_?([$^.]|[><]|\%[<>]?([$^V#]|'\l|(\.|\d)+[lcv]))|\\z[se]" contained containedin=Vregex contains=number_regex
syntax match delimiter_regex '\v\\[&|]' contained containedin=Vregex
syntax match matomeru_regex '\v\\[)(]' contained containedin=Vregex
syntax match characterClasses_regex '\v\\_?\[.+\]' contained containedin=Vregex contains=literal_characterClasses_regex
]])

vim.api.nvim_set_hl(0,"literal_regex",{link = "string"})
vim.api.nvim_set_hl(0,"ignored_regex",{link = "error"})
vim.api.nvim_set_hl(0,"number_regex",{link = "number"})
vim.api.nvim_set_hl(0,"escape_regex",{link = "@string.escape"})
vim.api.nvim_set_hl(0,"flag_regex",{link = "function"})
vim.api.nvim_set_hl(0,"characterClasses_regex",{link = "type"})
    vim.api.nvim_set_hl(0,"literal_characterClasses_regex",{link = "string"})
        vim.api.nvim_set_hl(0,"hanni_characterClasses_regex",{link = "@keyword"})
        vim.api.nvim_set_hl(0,"delimiter_hanni_characterClasses_regex",{link = "@operator"})
        vim.api.nvim_set_hl(0,"negation_characterClasses_regex",{link = "@operator"})
vim.api.nvim_set_hl(0,"malti_regex",{link = "number"})
    vim.api.nvim_set_hl(0,"delimiter_malti_regex",{link = "@punctuation.delimiter"})
vim.api.nvim_set_hl(0,"patternAtom_regex",{link = "special"})
vim.api.nvim_set_hl(0,"delimiter_regex",{link = "@punctuation.delimiter"})
vim.api.nvim_set_hl(0,"matomeru_regex",{link = "@punctuation.bracket"})
vim.api.nvim_set_hl(0,"ui2cmdline_regex",{link = "@punctuation.delimiter"})
