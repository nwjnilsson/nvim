
function ColorMyPencils(color)
	color = color or "rose-pine"

	vim.cmd(string.format([[ autocmd colorscheme * lua vim.notify(%s) ]], color))
	vim.api.nvim_set_hl(0, "Normal", { ctermbg = "none", bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { ctermbg = "none", bg = "none" })

end

ColorMyPencils()
