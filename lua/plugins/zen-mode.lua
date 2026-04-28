return {
  {
    "folke/zen-mode.nvim",
    keys = {
      { "gz", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
      {
        ";",
        function()
          if vim.b._zen_pending then
            vim.b._zen_pending = false
            vim.cmd("ZenMode")
          else
            vim.b._zen_pending = true
            vim.defer_fn(function()
              if vim.b._zen_pending then
                vim.b._zen_pending = false
                vim.fn.feedkeys(";", "n")
              end
            end, 300)
          end
        end,
        desc = "Double-tap ;;: Zen Mode / Single: repeat f/t",
      },
    },
    opts = {},
  },
}
