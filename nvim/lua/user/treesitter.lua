local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup {
    ensure_installed = "all",
    sync_install = false,
    ignore_install = { "" },
    highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true, disable = { "yaml" } },
}

-- Filetype mappings
-- TODO: fix this when it's not 2am
-- GLSLSLSLSLLSLGSLGLSGLGLSGLG WHYY
-- I just want .frag and .vert syntax highlighting. is that too much to ask?
