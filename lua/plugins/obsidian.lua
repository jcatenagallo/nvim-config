return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    workspaces = {
      {
        name = "juanvault",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/juanvault/",
      },
    },
    completion = {
      blink = true,
      nvim_cmp = false,
      min_chars = 0,
    },
  },

  -- Configurar keymaps usando autocmds (nueva forma)
  config = function(_, opts)
    require("obsidian").setup(opts)

    vim.api.nvim_create_autocmd("User", {
      pattern = "ObsidianNoteEnter",
      callback = function(ev)
        vim.keymap.set("n", "gf", "<cmd>ObsidianFollowLink<cr>", {
          buffer = ev.buf,
          desc = "Follow Link",
        })
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "ObsidianNoteEnter",
      callback = function(ev)
        vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianToday<cr>", {
          buffer = ev.buf,
          desc = "Obsidian Today",
        })
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "ObsidianNoteEnter",
      callback = function(ev)
        vim.keymap.set("n", "<leader>of", "<cmd>ObsidianNew<cr>", {
          buffer = ev.buf,
          desc = "Obsidian New",
        })
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "ObsidianNoteEnter",
      callback = function(ev)
        vim.keymap.set("n", "<leader>ox", "<cmd>ObsidianToggleCheckbox<cr>", {
          buffer = ev.buf,
          desc = "Obsidian New",
        })
      end,
    })
  end,
}
