local map = require("utils").map

map("n", "<space>tb", ":DapToggleBreakpoint<CR>")
map("n", "<space>do", ":DapUI<CR>")
map("n", "<F2>", ":DapContinue<CR>")
map("n", "<F3>", ":DapStepInto<CR>")
map("n", "<F4>", ":DapStepOver<CR>")
map("n", "<F5>", ":DapStepOut<CR>")
map("n", "t<C-r>", ":DapToggleRepl<CR>")
map("n", "t<C-t>", ":DapTerminate<CR>")
map("n", "t<C-v>", ":DapToggleVirtualText<CR>")

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
