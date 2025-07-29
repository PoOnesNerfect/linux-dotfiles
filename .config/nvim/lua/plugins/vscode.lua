-- Configurations when using vscode-neovim.
-- Modified from https://github.com/LazyVim/LazyVim/raw/main/lua/lazyvim/plugins/extras/vscode.lua

if not vim.g.vscode then
  return {}
end

local enabled = {
  "LazyVim",
  "dial.nvim",
  "flit.nvim",
  "lazy.nvim",
  "leap.nvim",
  "mini.ai",
  "mini.comment",
  "mini.move",
  "mini.pairs",
  "mini.surround",
  "nvim-treesitter",
  "nvim-treesitter-textobjects",
  "nvim-ts-context-commentstring",
  "snacks.nvim",
  "ts-comments.nvim",
  "vim-repeat",
  "yanky.nvim"
}

local Config = require("lazy.core.config")
Config.options.checker.enabled = false
Config.options.change_detection.enabled = false
Config.options.defaults.cond = function(plugin)
  return vim.tbl_contains(enabled, plugin.name) or plugin.vscode
end
vim.g.snacks_animate = false

-- Add some vscode specific keymaps
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimKeymapsDefaults",
  callback = function()
    -- VSCode-specific keymaps for search and navigation
    vim.keymap.set("n", "<leader><space>", "<cmd>Find<cr>")
    vim.keymap.set("n", "<c-/>", [[<cmd>lua require('vscode').action('workbench.action.findInFiles')<cr>]])
    vim.keymap.set("n", "<leader>ss", [[<cmd>lua require('vscode').action('workbench.action.gotoSymbol')<cr>]])

    vim.keymap.set({ "n", "x" }, "gr", "<Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>")
    vim.keymap.set({ "n", "x" }, "gi", "<Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>")
    vim.keymap.set({ "n", "x" }, "gs", "<Cmd>call VSCodeNotify('workbench.action.showAllSymbols')<CR>")
    vim.keymap.set({ "n", "x" }, "gD", "<Cmd>call VSCodeNotify('editor.action.revealDefinitionAside')<CR>")
    vim.keymap.set({ "n", "x" }, "<leader>d", "<Cmd>call VSCodeNotify('editor.action.peekDefinition')<CR>")
    vim.keymap.set({ "n", "x" }, "<leader>k", "<Cmd>call VSCodeNotify('editor.action.showDefinitionPreviewHover')<CR>")
    vim.keymap.set({ "n", "x" }, "gh", "<Cmd>call VSCodeNotify('editor.action.showDefinitionPreviewHover')<CR>")

    vim.keymap.set({ "n", "x" }, "<leader>a", "<Cmd>call VSCodeNotify('editor.action.quickFix')<CR>")
  
    -- toggle comment line
    vim.keymap.set({ "n", "x" }, "?", "<Cmd>call VSCodeNotify('editor.action.commentLine')<CR>", { desc = "Toggle comment line" })

    -- rename symbol
    vim.keymap.set({ "n", "x" }, "<leader>r", "<Cmd>call VSCodeNotify('editor.action.rename')<CR>")

    -- open file explorer
    vim.keymap.set({ "n", "x" }, "<leader>e", "<Cmd>call VSCodeNotify('workbench.view.explorer')<CR>")

    -- Keep undo/redo lists in sync with VsCode
    vim.keymap.set({ "n", "x" }, "u", "<Cmd>call VSCodeNotify('undo')<CR>")
    vim.keymap.set({ "n", "x" }, "<C-r>", "<Cmd>call VSCodeNotify('redo')<CR>")
    vim.keymap.set({ "n", "x" }, "U", "<Cmd>call VSCodeNotify('redo')<CR>", { desc = "Redo" })
    
    vim.keymap.set("n", "<C-k>", "<Cmd>call VSCodeNotify('workbench.action.navigateBack')<CR>")
    vim.keymap.set("n", "<C-j>", "<Cmd>call VSCodeNotify('workbench.action.navigateForward')<CR>")

    -- Navigate VSCode tabs like lazyvim buffers
    vim.keymap.set("n", "<S-h>", "<Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>")
    vim.keymap.set("n", "<S-l>", "<Cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>")
    vim.keymap.set({"n", "x"}, "<C-w>", "tabc")
    
    -- open file picker
    vim.keymap.set("n", "<C-f>", "<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>", { desc = "Open file picker" })
  end,
})

function LazyVim.terminal()
  require("vscode").action("workbench.action.terminal.toggleTerminal")
end

return {
  {
    "snacks.nvim",
    opts = {
      bigfile = { enabled = false },
      dashboard = { enabled = false },
      indent = { enabled = false },
      input = { enabled = false },
      notifier = { enabled = false },
      picker = { enabled = false },
      quickfile = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
    },
  },
  {
    "LazyVim/LazyVim",
    config = function(_, opts)
      opts = opts or {}
      -- disable the colorscheme
      opts.colorscheme = function() end
      require("lazyvim").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { highlight = { enable = false } },
  },
  {
  'vscode-neovim/vscode-multi-cursor.nvim',
  event = 'VeryLazy',
  cond = not not vim.g.vscode,
  opts = {
    default_mappings = false,
    no_selection = false
  },
  }
}
