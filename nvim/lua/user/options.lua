local options = {
-- Indentation
    shiftwidth = 4,
    tabstop = 4,
    expandtab = true,
    smartindent = true,

    relativenumber = true,
    number = true,
    hidden = true,
    mouse = "a",
    scrolloff = 8,
    sidescrolloff = 8,
    termguicolors = true,
    backup = false,
    splitbelow = true,
    splitright = true,
    signcolumn = "yes",
    syntax = "OFF",
    conceallevel = 1 -- required for links to work properly in neorg
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

