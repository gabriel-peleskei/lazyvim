-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = vim.keymap.set

map("n", "\\", function()
  if vim.bo.filetype == "neo-tree" then
    require("neo-tree.command").execute({ action = "close" })
    return
  end
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].filetype == "neo-tree" then
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_buf(win) == buf then
          vim.api.nvim_set_current_win(win)
          return
        end
      end
    end
  end
  require("neo-tree.command").execute({ focus = true, position = "current" })
end, { desc = "Toggle Neotree" })
map("n", "<c-left>", "<cmd>winc h<cr>", { desc = "Move to left window", remap = true })
map("n", "<c-right>", "<cmd>winc l<cr>", { desc = "Move to left window", remap = true })
map("n", "<c-up>", "<cmd>winc k<cr>", { desc = "Move to left window", remap = true })
map("n", "<c-down>", "<cmd>winc j<cr>", { desc = "Move to left window", remap = true })
--
map("n", "<leader>q<space>", "<cmd>q<cr>", { desc = "Quit Buffer" })
