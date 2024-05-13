function ColorMyPencils(color)
    color = color or "moonfly"
    vim.g.moonflyCursorColor = true
    vim.g.moonflyItalics = true
    vim.g.moonflyNormalFloat = false
    vim.g.moonflyTransparent = true
    vim.g.moonflyWinSeparator = 2
    vim.g.moonflyUnderlineMatchParen = true
    vim.g.moonflyVirtualTextColor = true
    vim.g.moonflyUndercurls = true
    vim.opt.fillchars = {
        horiz = '━',
        horizup = '┻',
        horizdown = '┳',
        vert = '┃',
        vertleft = '┫',
        vertright = '┣',
        verthoriz = '╋',
    }
    vim.cmd.colorscheme(color)
end

ColorMyPencils()

-- colorscheme tokyonight
-- colorscheme tokyonight-night
-- colorscheme tokyonight-storm
-- colorscheme tokyonight-day
-- colorscheme tokyonight-moon
