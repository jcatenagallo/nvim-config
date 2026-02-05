return {
  "piersolenski/wtf.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {},
  keys = {
    { "<leader>wd", function() require("wtf").ai() end, desc = "Debug diagnostic con AI" },
    { "<leader>ws", function() require("wtf").search() end, desc = "Buscar diagnostic en Google" },
  },
}
