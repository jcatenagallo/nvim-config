return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--glob=!node_modules/*",
        "--glob=!.git/*",
        "--glob=!.next/*",
        "--glob=!dist/*",
        "--glob=!build/*",
        "--glob=!*.lock",
      },
      file_ignore_patterns = {
        "node_modules/",
        "%.git/",
        "%.next/",
        "dist/",
        "build/",
      },
    },
  },
}
