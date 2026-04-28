-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Desactivar inlay hints (sugerencias de tipos en gris)
vim.lsp.inlay_hint.enable(false)

-- Priorizar .git como root en monorepos (evita que LSP cambie el CWD a subdirectorios)
vim.g.root_spec = { { ".git" }, "lsp", "cwd" }

-- Folding con Treesitter (colapsar bloques con za, zc, zo)
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99 -- abre todo por defecto (nada colapsado al abrir archivo)
