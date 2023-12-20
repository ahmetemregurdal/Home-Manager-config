local o = { noremap = true, silent = true }
local k = vim.keymap.set
k("", "<Space>", "<Nop>", o)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Normal --
-- Navigation --
k("n", "<C-h>", "<C-w>h", o)
k("n", "<C-j>", "<C-w>j", o)
k("n", "<C-k>", "<C-w>k", o)
k("n", "<C-l>", "<C-w>l", o)

-- Resizing --
k("n", "<C-Up>", ":resize +2<CR>", o)
k("n", "<C-Down>", ":resize -2<CR>", o)
k("n", "<C-Left>", ":vertical resize -2<CR>", o)
k("n", "<C-Right>", ":vertical resize +2<CR>", o)
-- Buffer Navigation --
k("n", "<S-l>", ":bnext<CR>", o)
k("n", "<S-h>", ":bprevious<CR>", o)

-- Insert --
-- Fast esc --
k("i", "jk", "<ESC>", o)

-- Visual --
-- Stay in indentation mode --
k("v", "<", "<gv", o)
k("v", ">", ">gv", o)
-- Move text up and down --
k("v", "<A-j>", ":m .+1<CR>==", o)
k("v", "<A-k>", ":m .-2<CR>==", o)
-- Dont yank when pasted above --
k("v", "p", '"_dP', o)

-- Visual Block --
-- Move text up and down --
k("x", "J", ":move '>+1<CR>gv-gv", o)
k("x", "K", ":move '<-2<CR>gv-gv", o)
k("x", "<A-j>", ":move '>+1<CR>gv-gv", o)
k("x", "<A-k>", ":move '<-2<CR>gv-gv", o)

-- LSP
k("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", o)

k("n", "<F5>", function()
	if vim.bo.filetype == "python" then
		vim.cmd(':TermExec cmd="python3 %:p" direction=float')
	elseif vim.bo.filetype == "cpp" then
		vim.cmd(":!g++ -O2 %:p -o ~/.cache/vim-autorun.out")
		vim.cmd(":TermExec cmd='~/.cache/vim-autorun.out' direction=float")
	elseif vim.bo.filetype == "c" then
		vim.cmd(":!gcc -O2 %:p -o ~/.cache/vim-autorun.out")
		vim.cmd(":TermExec cmd='~/.cache/vim-autorun.out' direction=float")
	elseif vim.bo.filetype == "sh" then
		vim.cmd(':TermExec cmd="bash %:p" direction=float')
	elseif vim.bo.filetype == "kotlin" then
		vim.cmd(":!kotlinc %:p -include-runtime -d ~/.cache/vim-autorun.jar")
		vim.cmd(":TermExec cmd='java -jar ~/.cache/vim-autorun.jar' direction=float")
	end
end)
