neovim用の"syntax"コマンドを使ったシンタクスハイライト

使い方
    このディレクトリをruntimepathに追加する

以下 それぞれのシンタクスハイライトの説明

bnf
    バッカス・ナウア記法

regex
    vimの正規表現
    "very magic"もしくは"very nomagic"のみ正しくハイライトできる
    主に検索cmdwin用
    vim.api.nvim_create_autocmd('CmdWinEnter',{
        pattern = {"/","?"},
        callback = function()
            vim.bo.filetype = "regex"
        end,
    })

skk
    ユーザ辞書以外のSKK辞書
    lispに対応

skk-users
    SKKのユーザ辞書
    ユーザ辞書にしかない"[う/使/遣/]"のようなものに対応

skk-specialized
    特定分野に関するSKK辞書
    候補の分類を取得し それが含まれない候補をエラーにする
    "b:skk_bunnrui"に候補の分類を代入する これにモジュール"skk_commands"の関数"annotate"を組み合わせると 分類注釈の追加が楽にできる

    luaのモジュール"skk"が必要
    モジュールの場所は"https://github.com/stg73/modules.nvim"

url
    URL
