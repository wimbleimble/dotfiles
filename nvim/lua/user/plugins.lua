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
        "nvim-telescope/telescope-bibtex.nvim",
        dependencies = {"nvim-telescope/telescope.nvim"},
    },
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            ts = require("telescope")
            ts.setup({
                bibtex = {
                    global_files = {
                        "~/documents/bibliography.bib"
                    },
                    context = true,
                    context_fallback = true
                }
            })
            ts.load_extension("bibtex")

        end
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
                },
            }
        end,
        lazy = false
    },
    {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" }
        },

    },

    {
        'nvim-orgmode/orgmode',
        event = 'VeryLazy',
        config = function()
            require('orgmode').setup({
                org_agenda_files = '~/org/**/*',
                org_default_notes_file = '~/org/refile.org',
                org_todo_keywords = {"TODO(t)", "ACTIVE(a)", "|", "DONE(d)", "CANCELLED(c)"},
                mappings = {
                    org = {
                        org_open_at_point = "<Enter>"
                    }
                }
            })
            -- Experimental LSP support
            vim.lsp.enable('org')
            vim.api.nvim_create_autocmd('FileType', {
              pattern = 'org',
              callback = function()
                vim.keymap.set('i', '<S-CR>', '<cmd>lua require("orgmode").action("org_mappings.meta_return")<CR>', {
                  silent = true,
                  buffer = true,
                })
              end,
            })
        end,
    },
    {
        "chipsenkbeil/org-roam.nvim",
        dependencies = { "nvim-orgmode/orgmode" },
        config = function()
            require("org-roam").setup({
                directory = "~/org"
            })
        end

    },
    {
        "nvim-orgmode/org-bullets.nvim",
        dependencies = { "nvim-orgmode/orgmode" },
        opts = {
            symbols = {
                headlines = {"◉", "○", "", ""},
                checkboxes = {
                    half = { "", "@org.checkbox.halfchecked" },
                    done = { "", "@org.keyword.done" },
                    todo = { " ", "@org.keyword.todo" },
                },
            }
        }
    },
    {
        "lukas-reineke/headlines.nvim",
        dependencies = {"nvim-treesitter/nvim-treesitter", "nvim-orgmode/orgmode"},
        config = {
            org = {
                bullets = {"◉", "○", "", ""}, -- overrides bullets
                --fat_headlines = false
            }
        }
    },

    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            image = {}
        }
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
