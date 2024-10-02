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

package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"

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
    "fladson/vim-kitty",

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

    {
        "nvim-neorg/neorg",
        version = "*",
        config = function()
            require('neorg').setup {
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {},
                    ["core.dirman"] = {
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
                    ["core.latex.renderer"] = {}
                },
            }
        end,
        lazy = false
    },

    {
        "3rd/image.nvim",
        config = function()
            require("image").setup({
                backend = "kitty",
                integrations = {
                    neorg = {
                        enabled = true,
                        clear_in_insert_mode = false,
                        download_remote_images = true,
                        only_render_image_at_cursor = false,
                        filetypes = { "norg" },
                    },
                },
                max_width = nil,
                max_height = nil,
                max_width_window_percentage = nil,
                max_height_window_percentage = 50,
                window_overlap_clear_enabled = false,
                window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
                hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
            })
        end
    },

    -- Misc
    {
        "stevearc/oil.nvim",
        config = true,
    }

}
local opts = {}

require("lazy").setup(plugins, opts)
