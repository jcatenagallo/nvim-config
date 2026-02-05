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

vim.keymap.set("n", "<leader>yp", function()
  local path = vim.fn.expand("%:.")
  vim.fn.setreg("+", path)
  print("Copied: " .. path)
end, { desc = "Copy relative file path" })

-- 📋 Copiar referencia de líneas seleccionadas para IA
vim.keymap.set("v", "<leader>yi", function()
  local start_line = vim.fn.line("v")
  local end_line = vim.fn.line(".")
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end
  local path = vim.fn.expand("%:.")
  local msg = "lineas " .. start_line .. "-" .. end_line .. " de " .. path
  vim.fn.setreg("+", msg)
  print("Copied: " .. msg)
end, { desc = "Copy line reference for AI" })

-- 🪟 Split navigation con q + jkl;
vim.keymap.set("n", "qj", "<C-w>h", { desc = "Ir al split izquierdo" }) -- q + j
vim.keymap.set("n", "qk", "<C-w>j", { desc = "Ir al split abajo" }) -- q + k
vim.keymap.set("n", "ql", "<C-w>k", { desc = "Ir al split arriba" }) -- q + l
vim.keymap.set("n", "q;", "<C-w>l", { desc = "Ir al split derecho" }) -- q + ;

-- 🔙 Volver a posición previa del cursor
vim.keymap.set("n", "<leader>hh", "<C-o>", { desc = "Volver a posición previa" })

-- 🔍 Grep palabra bajo el cursor
vim.keymap.set("n", "<leader>sp", function()
  local word = vim.fn.expand("<cword>")
  Snacks.picker.grep({ search = word })
end, { desc = "Grep palabra bajo cursor" })

-- 🔍 Buscar palabra bajo el cursor en el archivo
vim.keymap.set("n", "<leader>sf", function()
  local word = vim.fn.expand("<cword>")
  vim.fn.setreg("/", word)
  vim.cmd("normal! n")
end, { desc = "Buscar palabra en archivo" })

-- Agregar archivo actual a la quickfix list
vim.keymap.set("n", "<leader>xa", function()
  local fname = vim.fn.expand("%:p")
  local lnum = vim.fn.line(".")
  local text = vim.fn.getline(".")
  vim.fn.setqflist({}, "a", { items = { { filename = fname, lnum = lnum, text = text } } })
  vim.notify("Added to quickfix: " .. vim.fn.expand("%:."), vim.log.levels.INFO)
end, { desc = "Add file to Quickfix List" })

-- 🔄 Reiniciar LSP (fuerza re-lint del archivo)
vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr>", { desc = "Reiniciar LSP" })

-- 🔀 Diffview contra origin/develop
vim.keymap.set("n", "<leader>gD", "<cmd>DiffviewOpen origin/develop<cr>", { desc = "Diffview vs origin/develop" })

-- 🐛 Console.log debug para React/JS
vim.keymap.set("n", "<leader>dl", function()
  local word = vim.fn.expand("<cword>")
  local filename = vim.fn.expand("%:t")
  local log_line = string.format("console.log('debug [%s] [%s] ', %s)", filename, word, word)
  local current_line = vim.fn.line(".")
  local indent = vim.fn.indent(current_line)
  local spaces = string.rep(" ", indent)
  vim.fn.append(current_line, spaces .. log_line)
end, { desc = "Console.log debug variable" })
