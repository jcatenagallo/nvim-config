return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
    settings = {
      save_on_toggle = true,
    },
  },
  keys = function()
    local keys = {
      {
        "<leader>H",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon File",
      },
      {
        "<leader>h",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon Quick Menu",
      },
      {
        "<leader>hd",
        function()
          require("harpoon"):list():remove()
        end,
        desc = "Remove current file from Harpoon",
      },
      {
        "<leader>hc",
        function()
          require("harpoon"):list():clear()
        end,
        desc = "Clear all Harpoon files",
      },
    }

    for i = 1, 5 do
      table.insert(keys, {
        "<leader>" .. i,
        function()
          require("harpoon"):list():select(i)
        end,
        desc = "Harpoon to File " .. i,
      })
    end

    -- Custom key mappings for positions 1-4
    local custom_keys = {
      { key = "j", pos = 1, desc = "Harpoon File 1" },
      { key = "k", pos = 2, desc = "Harpoon File 2" },
      { key = "l", pos = 3, desc = "Harpoon File 3" },
      { key = ";", pos = 4, desc = "Harpoon File 4" },
    }

    for _, mapping in ipairs(custom_keys) do
      table.insert(keys, {
        "<leader>" .. mapping.key,
        function()
          require("harpoon"):list():select(mapping.pos)
        end,
        desc = mapping.desc,
      })
    end
    return keys
  end,
}
