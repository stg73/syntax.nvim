## 概要

neovim用の `:syntax` コマンドを使ったシンタクスハイライト。

## 使い方

このディレクトリを `runtimepath` に追加する。

## それぞれのシンタクスハイライトの説明

- bnf

  バッカス・ナウア記法

- regex

  vimの正規表現

  `very magic` もしくは `very nomagic` のみ正しくハイライトできる。

  使用例:
  ```lua
  vim.api.nvim_create_autocmd('CmdWinEnter',{
      pattern = {"/","?"},
      callback = function()
          if string.match(vim.fn.getcmdwintype(),"[/?]") then -- "-" や "@" のタイプを避ける
              vim.bo.filetype = "regex"
          end
      end,
  })
  ```

  ui2ならコマンドラインにも適用できる:
  ```lua
  vim.api.nvim_create_autocmd("CmdLineEnter",{
      pattern = {"/","?"},
      callback = function()
          local cmdline = require("vim._core.ui2").bufs.cmd
          if string.match(vim.fn.getcmdtype(),"[/?]") then
              vim.bo[cmdline].syntax = "regex"
          end
      end,
  })
  vim.api.nvim_create_autocmd("CmdLineLeave",{
      group = group,
      pattern = {"/","?"},
      callback = function()
          local cmdline = require("vim._core.ui2").bufs.cmd
          vim.bo[cmdline].syntax = ""
      end,
  })
  ```

- skk

  ユーザ辞書以外のSKK辞書

  lispに対応。

- skk-users

  SKKのユーザ辞書

  ユーザ辞書にしかない `[う/使/遣/]` のようなものに対応。

- skk-specialized

  特定分野に関するSKK辞書

  候補の分類を取得し、それが含まれない候補をエラーにする。

  `b:skk_bunnrui` に候補の分類を代入する。これにモジュール `skk` の関数 `command.annotate` を組み合わせると、分類注釈の追加が楽にできる

  luaのモジュール `skk` が必要。
  モジュールの場所: https://github.com/stg73/modules.nvim

- url

  URL
