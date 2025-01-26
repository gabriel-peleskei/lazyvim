return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    opts = function(_)
      vim.api.nvim_set_hl(0, "NeoTreeNormal", { background = "NONE" })
      -- vim.cmd("highlight NeoTreeNormal guibg=NONE ctermbg=NONE")
      return {
        filesystem = {
          hijack_netrw_behavior = "disabled",
          window = {
            mappings = {
              ["\\"] = "close_window",
            },
            popup = {
              position = {
                col = "50%",
                row = "50%",
              },
              size = function()
                local cols = vim.o.columns
                local rows = vim.o.lines
                return {
                  width = math.floor(cols * 0.99),
                  height = math.floor(rows * 0.99),
                }
              end,
              border = "rounded",
              win_options = {
                winblend = 100,
              },
            },
          },
          -- bind_to_cwd = false,
          use_libuv_file_watcher = true,
        },
        event_handlers = {
          {
            event = "file_open_request",
            handler = function()
              require("neo-tree.command").execute({ action = "close" })
            end,
          },
          {
            event = "file_opened",
            handler = function()
              require("neo-tree").close_all()
            end,
          },
        },
      }
    end,
  },
}
