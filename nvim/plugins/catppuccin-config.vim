lua << EOF
local catppuccin = require("catppuccin")

catppuccin.setup()
EOF

let g:catppuccin_flavour = "mocha" " latte, frappe, macchiato, mocha
colorscheme catppuccin
