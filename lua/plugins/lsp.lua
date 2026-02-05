return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      servers = {
        vtsls = {
          settings = {
            typescript = {
              preferences = {
                includeCompletionsForModuleExports = true,
                includeCompletionsWithSnippetText = true,
              },
              tsserver = {
                maxTsServerMemory = 4096,
              },
              -- Expandir tipos completos sin truncar
              format = {
                indentSize = 2,
              },
            },
            javascript = {
              preferences = {
                includeCompletionsForModuleExports = true,
              },
            },
            vtsls = {
              experimental = {
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
              },
            },
          },
        },
      },
    },
    init = function()
      -- Configurar hover con scroll y tamaño expandido
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
        max_width = 120,
        max_height = 40,
      })
    end,
  },
  -- Expand hover window for long type definitions
  {
    "folke/noice.nvim",
    optional = true,
    opts = {
      lsp = {
        hover = {
          silent = true,
        },
      },
    },
  },
}
