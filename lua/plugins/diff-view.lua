return {
  {
    "sindrets/diffview.nvim",
    lazy = false,
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
      { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = {
          winbar_info = true,
        },
      },
      keymaps = {
        file_panel = {
          {
            "n",
            "gf",
            function()
              require("diffview.actions").goto_file_edit()
            end,
            { desc = "Go to file (keep Diffview open)" },
          },
        },
      },
    },
  },
}
