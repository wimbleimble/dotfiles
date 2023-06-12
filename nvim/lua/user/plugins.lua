-- Automatic packer installation, stolen from the github readme.

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd "packadd packer.nvim"
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

local function config_catppuccin()
    vim.g.catppuccin_flavour = "mocha"
    require("catppuccin").setup()
    vim.cmd "colorscheme catppuccin"
end

require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    -- Theme
    use { "catppuccin/nvim",
        as = "catppuccin",
        config = config_catppuccin }

    -- Telescope
    use { "nvim-telescope/telescope.nvim", tag = "0.1.0",
        requires = { { "nvim-lua/plenary.nvim" } } }

    -- Autocompletion
    use { "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-path" }
    use { "hrsh7th/cmp-cmdline" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-nvim-lua" }

    use { "L3MON4D3/LuaSnip" }
    use { "saadparwaiz1/cmp_luasnip" }

    -- LSP
    use "neovim/nvim-lspconfig"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }

    -- Git
    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup(require("user.gitsigns-config"))
        end
    }

    -- Notes
    use {
        "mickael-menu/zk-nvim",
        config = function()
            require("zk").setup(require("user.zk-config"))
        end
    }

    -- Other
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup(require("user.todo-config"))
            vim.keymap.set("n", "]t", function()
                require("todo-comments").jump_next()
            end, { desc = "Next todo comment" })

            vim.keymap.set("n", "[t", function()
                require("todo-comments").jump_prev()
            end, { desc = "Previous todo comment" })
        end
    }
    use { 'glepnir/dashboard-nvim' }

    if packer_bootstrap then
        require('packer').sync()
    end
end)

