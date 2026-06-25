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
    conceallevel = 2 -- required for links to work properly in neorg
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.filetype.add {
  extension = { rasi = 'rasi' },
  pattern = {
    ['.*/waybar/config'] = 'jsonc',
    ['.*/mako/config'] = 'dosini',
    ['.*/kitty/*.conf'] = 'bash',
    ['.*/hypr/.*%.conf'] = 'hyprlang',
  },
}

vim.api.nvim_create_autocmd('BufRead', {
  callback = function(opts)
    vim.api.nvim_create_autocmd('BufWinEnter', {
      once = true,
      buffer = opts.buf,
      callback = function()
        local ft = vim.bo[opts.buf].filetype
        local last_known_line = vim.api.nvim_buf_get_mark(opts.buf, '"')[1]
        if
          not (ft:match('commit') and ft:match('rebase'))
          and last_known_line > 1
          and last_known_line <= vim.api.nvim_buf_line_count(opts.buf)
        then
          vim.api.nvim_feedkeys([[g`"]], 'nx', false)
        end
      end,
    })
  end,
})
