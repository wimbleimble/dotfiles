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
        version = "v9.4.0",
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
                    ["core.latex.renderer"] = {},
                    ["external.templates"] = {
                            -- templates_dir = vim.fn.stdpath("config") .. "/templates/norg",
                            -- default_subcommand = "add", -- or "fload", "load"
                            -- keywords = { -- Add your own keywords.
                            --   EXAMPLE_KEYWORD = function ()
                            --     return require("luasnip").insert_node(1, "default text blah blah")
                            --   end,
                            -- },
                            -- snippets_overwrite = {},
                          }
                },
            }

        end,
        dependencies = {
            { "pysan3/neorg-templates", dependencies = { "L3MON4D3/LuaSnip" } },
          },
        lazy = false
    },

    {
      'nvim-orgmode/orgmode',
      event = 'VeryLazy',
      config = function()
        require('orgmode').setup({
          org_agenda_files = '~/notes/**/*',
          org_default_notes_file = '~/notes/refile.org',
        })
       -- Experimental LSP support
       vim.lsp.enable('org')
      end,
    },
    {
      "seflue/org-link.nvim",
      event = "VeryLazy",
      opts = {},
    },
        

    {
        "benlubas/molten-nvim",
        version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        dependencies = { "3rd/image.nvim" },
        build = ":UpdateRemotePlugins",
        init = function()
            -- these are examples, not defaults. Please see the readme
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_output_win_max_height = 20
        end,
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
                max_width = 100,
                max_height = 12,
                max_width_window_percentage = math.huge,
                max_height_window_percentage = math.huge,
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
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    }

}
local opts = {}

require("lazy").setup(plugins, opts)
