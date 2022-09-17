local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
    vim.notify "Failed to load Mason."
    return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
    vim.notify "Failed to load Mason LSPConfig."
    return
end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    vim.notify "Failed to load LSPConfig"
    return
end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
});


mason_lspconfig.setup();

mason_lspconfig.setup_handlers {
    function (server_name)
        local server_config_ok, server_config =
            pcall(require, "user.lsp.config." .. server_name)

        local default_opts = {
            on_attach = require("user.lsp.core_config").on_attach,
            capabilities = require("user.lsp.core_config").capabilities
        }

        local opts = nil
        if not server_config_ok then
            opts = default_opts
        else
            opts = vim.tbl_deep_extend("force", default_opts, server_config)
        end

        lspconfig[server_name].setup(opts)
    end,
}

