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
    opts = {
      filesystem = {
        hijack_netrw_behavior = "open_current",
        window = {
          mappings = {
            ["\\"] = "close_window",
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
    },
  },
}
