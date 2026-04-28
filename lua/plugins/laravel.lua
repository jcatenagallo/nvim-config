return {
  {
    "adibhanna/laravel.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
    },
    ft = { "php", "blade" },
    cmd = {
      "Artisan",
      "Composer",
      "ComposerRequire",
      "ComposerRemove",
      "ComposerDependencies",
      "LaravelRoute",
      "LaravelMake",
      "LaravelStatus",
      "LaravelGoto",
      "LaravelDumps",
      "LaravelDumpsEnable",
      "LaravelDumpsDisable",
      "LaravelDumpsToggle",
      "LaravelDumpsClear",
      "LaravelIdeHelper",
      "LaravelIdeHelperCheck",
      "Sail",
      "SailUp",
      "SailDown",
      "SailRestart",
      "SailTest",
      "SailShell",
    },
    keys = {
      { "<leader>la", "<cmd>Artisan<cr>", desc = "Laravel Artisan" },
      { "<leader>lc", "<cmd>Composer<cr>", desc = "Composer" },
      { "<leader>lo", "<cmd>LaravelRoute<cr>", desc = "Laravel Routes" },
      { "<leader>lm", "<cmd>LaravelMake<cr>", desc = "Laravel Make" },
      { "<leader>ls", "<cmd>LaravelStatus<cr>", desc = "Laravel Status" },
      { "<leader>ld", "<cmd>LaravelDumps<cr>", desc = "Laravel Dumps" },
    },
    opts = {
      notifications = true,
      debug = false,
      keymaps = false,
      sail = {
        enabled = true,
        auto_detect = true,
      },
    },
    config = function(_, opts)
      require("laravel").setup(opts)
    end,
  },
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        default = { "laravel" },
        providers = {
          laravel = {
            name = "laravel",
            module = "laravel.blink_source",
          },
        },
      },
    },
  },
}
