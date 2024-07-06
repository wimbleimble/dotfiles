local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {

    -- Theme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            vim.g.catppuccin_flavour = "mocha"
            require("catppuccin").setup()
            vim.cmd "colorscheme catppuccin"
        end
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    -- Autocompletion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",

    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",

    -- LSP
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- Git
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup(require("user.gitsigns-config"))
        end
    },

    -- Notes
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true
    },

    {
        "nvim-neorg/neorg",
        dependencies = { "luarocks.nvim" },
        version = "*",
        config = function()
            require('neorg').setup {
                load = {
                    ["core.defaults"] = {},  -- Loads default behaviour
                    ["core.concealer"] = {}, -- Adds pretty icons to your documents
                    ["core.dirman"] = {      -- Manages Neorg workspaces
                        config = {
                            workspaces = {
                                notes = "~/notes",
                                dnd = "~/documents/dnd"
                            },
                            default_workspace = "notes",
                        },
                    },
                    ["core.summary"] = {},
                    ["core.export"] = {},
                    ["core.export.markdown"] = {
                        config = {
                            extensions = "all",
                        }
                    },
                    ["core.ui.calendar"] = {},
                },
            }
        end,
        lazy = false
    },

    -- Misc
    {
        "stevearc/oil.nvim",
        config = true,
    }

}
local opts = {}

require("lazy").setup(plugins, opts)
