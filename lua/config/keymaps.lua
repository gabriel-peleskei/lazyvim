-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = vim.keymap.set

local diag_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity or vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

map("n", "\\", function()
  require("neo-tree.command").execute({ position = "float" })
end, { desc = "Toggle Neotree" })
map("n", "<c-left>", "<cmd>winc h<cr>", { desc = "Move to left window", remap = true })
map("n", "<c-right>", "<cmd>winc l<cr>", { desc = "Move to left window", remap = true })
map("n", "<c-up>", "<cmd>winc k<cr>", { desc = "Move to left window", remap = true })
map("n", "<c-down>", "<cmd>winc j<cr>", { desc = "Move to left window", remap = true })
--
map("n", "<leader>q<space>", "<cmd>q<cr>", { desc = "Quit Buffer" })
map("n", "<leader>ee", diag_goto(true, vim.diagnostic.severity.ERROR), { desc = "Next Error" })
map("n", "<leader>en", diag_goto(true), { desc = "Next Diagnostic" })
map("n", "<leader>ep", diag_goto(false), { desc = "Previous Diagnostic" })
