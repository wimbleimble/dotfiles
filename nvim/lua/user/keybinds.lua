local function map(mode, shortcut, command)
	vim.api.nvim_set_keymap(
		mode, shortcut, command,
		{ noremap = true, silent = true })
end

local function nmap(shortcut, command)
	map("n", shortcut, command)
end

map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

nmap("gf", ":edit <cfile><cr>")
nmap("<leader>x", ":!xdg-open %<cr><cr>")
nmap("<leader>p", "p :let @\"=@0")

-- Tabs
nmap("H", "gT")
nmap("L", "gt")
nmap("<leader>1", "1gt")
nmap("<leader>2", "2gt")
nmap("<leader>3", "3gt")
nmap("<leader>4", "4gt")
nmap("<leader>5", "5gt")
nmap("<leader>6", "6gt")
nmap("<leader>7", "7gt")
nmap("<leader>8", "8gt")
nmap("<leader>9", "9gt")
nmap("<leader>0", "0gt")

-- Windows
nmap("<C-h>", "<C-w>h");
nmap("<C-j>", "<C-w>j");
nmap("<C-k>", "<C-w>k");
nmap("<C-l>", "<C-w>l");

-- Buffers
nmap("<A-l>", ":bnext<cr>");
nmap("<A-h>", ":bprev<cr>");

-- Telescope Keybinds
nmap("<leader>ff", ":Telescope find_files<cr>")
nmap("<leader>fs", ":Telescope live_grep<cr>")
nmap("<leader>fb", ":Telescope buffers<cr>")
nmap("<leader>fh", ":Telescope help_tags<cr>")
nmap("<leader>ft", ":TodoTelescope<cr>")
-- Telescope Git Things
nmap("<leader>fgb", ":Telescope git_branches<cr>")
nmap("<leader>fgc", ":Telescope git_commits<cr>")
nmap("<leader>fgs", ":Telescope git_status<cr>")

-- ZK
nmap("<leader>zf", ":ZkNotes<cr>")
