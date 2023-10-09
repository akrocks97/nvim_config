require('rose-pine').setup({
    disable_background = true
})

require('catppuccin').setup( {
  flavour = "mocha",
  transparent_background = true,
  term_colors = true
})

require('onedark').setup {
  style = 'dark',
  transparent = true,
  term_colors = true,
}
require('onedark').load()

vim.cmd.colorscheme("onedark")

function ColorMyPencils(color)
  color = color or "catppuccin-mocha"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils("onedark")
