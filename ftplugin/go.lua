local map = require("utils").map

map("n", "t<C-d>", ":lua require'dap-go'.debug_test()<CR>")
