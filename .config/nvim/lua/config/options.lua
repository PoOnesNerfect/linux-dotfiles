-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.shiftwidth = 4
opt.tabstop = 4
opt.timeoutlen = 500

-- Allow l to wrap to next line at end of line, h to wrap to previous line at beginning
opt.whichwrap:append("l,h")

-- Enable line wrapping
opt.wrap = true
opt.linebreak = true  -- Break lines at word boundaries
opt.breakindent = true  -- Preserve indentation when wrapping

if not vim.g.vscode then
    vim.g.clipboard = "osc52";
end
