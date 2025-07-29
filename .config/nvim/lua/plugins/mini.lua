return {
    -- Flash enhances the built-in search functionality by showing labels
    -- at the end of each match, letting you quickly jump to a specific
    -- location.
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        vscode = true,
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { ";", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        },
    },
{
  "echasnovski/mini.surround",
  keys = function(_, keys)
    -- Populate the keys based on the user's options
    local opts = LazyVim.opts("mini.surround")
    local mappings = {
      { opts.mappings.add, desc = "Add Surrounding", mode = { "n", "v" } },
      { opts.mappings.delete, desc = "Delete Surrounding" },
      { opts.mappings.find, desc = "Find Right Surrounding" },
      { opts.mappings.find_left, desc = "Find Left Surrounding" },
      { opts.mappings.highlight, desc = "Highlight Surrounding" },
      { opts.mappings.replace, desc = "Replace Surrounding" },
      { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
    }
    mappings = vim.tbl_filter(function(m)
      return m[1] and #m[1] > 0
    end, mappings)
    return vim.list_extend(mappings, keys)
  end,
  opts = {
    mappings = {
      add = "ms", -- Add surrounding in Normal and Visual modes
      delete = "md", -- Delete surrounding
      find = "mm", -- Find surrounding (to the right)
      find_left = "mF", -- Find surrounding (to the left)
      highlight = "mh", -- Highlight surrounding
      replace = "mr", -- Replace surrounding
      update_n_lines = "mn", -- Update `n_lines`
    },
  },
}
}