-- 共通部分の読み込み
vim.cmd.runtime('syntax/skk.lua')
vim.cmd.runtime('ftplugin/skk.lua')

vim.b.skk_bunnrui = vim.b.skk_bunnrui or require("skk").get.bunnrui_from_table(vim.api.nvim_buf_get_lines(0,0,-1,false)) or false -- 分類の判定を上書きできるように  分類が決定できない時にはfalseを代入してコマンドラインで補完ができるようにする

if vim.b.skk_bunnrui then
    vim.cmd.syntax([[match bunnruiNotFound_kouho_skk '\v\/@<=([^/]+;\[]] .. vim.b.skk_bunnrui .. [[\])@![^/]+' contained containedin=kouho_skk]])
end

vim.api.nvim_set_hl(0,'bunnruiNotFound_kouho_skk',{link = 'error'})
