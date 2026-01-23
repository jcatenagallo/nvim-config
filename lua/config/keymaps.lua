-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 📂 Focus en explorador
vim.keymap.set("n", "<leader>o", function()
  vim.cmd("wincmd h")
end, { desc = "Focus explorador" })

-- 🔄 Redo
vim.keymap.set("n", "<C-r>", "<C-r>", { desc = "Redo" })
vim.keymap.set("n", "<leader>r", "<C-r>", { desc = "Redo alternativo" })

-- 🔍 Autocompletado con doble punto y coma
vim.keymap.set("i", ";;", "<C-x><C-o>", { desc = "Activar autocompletado LSP" })

vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })

-- 📋 Copiar ruta relativa del archivo
vim.keymap.set("n", "<leader>fy", function()
  vim.fn.setreg("+", vim.fn.expand("%"))
  print("Copied: " .. vim.fn.expand("%"))
end, { desc = "Copy relative file path" })

-- 🪟 Split navigation con q + jkl;
vim.keymap.set("n", "qj", "<C-w>h", { desc = "Ir al split izquierdo" })   -- q + j
vim.keymap.set("n", "qk", "<C-w>j", { desc = "Ir al split abajo" })       -- q + k
vim.keymap.set("n", "ql", "<C-w>k", { desc = "Ir al split arriba" })      -- q + l
vim.keymap.set("n", "q;", "<C-w>l", { desc = "Ir al split derecho" })     -- q + ;

-- 🔙 Volver a posición previa del cursor
vim.keymap.set("n", "<leader>hh", "<C-o>", { desc = "Volver a posición previa" })

-- 📝 Git: recorrer archivos con cambios (unstaged/staged)
vim.keymap.set("n", "<leader>gm", function()
  require("snacks").picker.git_status()
end, { desc = "Git modified files" })
