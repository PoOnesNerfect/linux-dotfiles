-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "x" }, "<bs>", "gg0", { desc = "Go to the beginning of the file" })
vim.keymap.set({ "n", "x" }, "`", "G$", { desc = "Go to the end of the file" })
vim.keymap.set({ "n", "x" }, "E", "$", { desc = "Go to the end of the line" })
vim.keymap.set({ "n", "x" }, "B", "^", { desc = "Go to the beginning of the line" })

-- w selects the word under cursor
vim.keymap.set({ "n" }, "w", "viw", { desc = "Select inner word" })
vim.keymap.set({ "x" }, "w", "e");

-- some personal customizations
vim.keymap.set({ "n", "x" }, "K", "{", { desc = "Go to the previous paragraph" })
vim.keymap.set({ "n", "x" }, "J", "}", { desc = "Go to the next paragraph" })
vim.keymap.set({ "n", "x" }, "\\", "O", { desc = "Go to the previous line" })
vim.keymap.set({ "n", "x" }, "<cr>", "o", { desc = "Open a new line below" })

-- select all; doesn't work; set in vscode keybindings.json
vim.keymap.set({ "n", "x" }, "<c+a>", "<esc>ggVG", { desc = "Select all" })

-- s is now v
vim.keymap.set({ "n" }, "s", "v");
vim.keymap.set({ "n", "x" }, "S", function()
if vim.fn.mode() == "V" then
    return "j"
else
    return "V"
end
end, { nowait = true, expr = true })

-- F can be extend to f
vim.keymap.set({ "n" }, "F", "vf", { remap = true });

-- esc clears search if exists
vim.keymap.set({ "x", "n" }, "<esc>", function()
    -- Check if there's a search highlight and clear it
    if vim.v.hlsearch == 1 then
        vim.cmd('nohl')
    end

    return "<esc>"
end, { expr = true, desc = "Escape and cancel multicursor" })

-- helixify keymaps
vim.keymap.set("n", "d", "x", { desc = "Delete character", nowait = true })

-- x is select line
vim.keymap.set("n", "x", "V")
vim.keymap.set("x", "x", function()
if vim.fn.mode() == "V" then
    return "j"
else
    return "V"
end
end, { nowait = true, expr = true })

-- Map o and O to switch case
vim.keymap.set("n", "o", "gul", { desc = "Convert to lowercase" })
vim.keymap.set("x", "o", "gu", { desc = "Convert to lowercase" })
vim.keymap.set("n", "O", "gUl", { desc = "Convert to uppercase" })
vim.keymap.set("x", "O", "gU", { desc = "Convert to uppercase" })

-- R in visual mode to replace selection with yanked text
vim.keymap.set("n", "R", "v\"_dP", { desc = "Replace selection with yanked text" })
vim.keymap.set("x", "R", "\"_dP", { desc = "Replace selection with yanked text" })

vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement number", nowait = true })

-- Remove all = prefix mappings since you don't use auto-indent
vim.keymap.del("n", "=")
vim.keymap.del("x", "=")

-- Now map = to increment since there are no conflicts
vim.keymap.set("n", "=", "<C-a>", { desc = "Increment number", nowait = true })

vim.keymap.del({ "n", "x" }, "t")

-- Search select
vim.keymap.set("x", "/", "y/<C-r>\"<CR>gv", { desc = "Search and stay on current match" })
vim.keymap.set({ "n", "x" }, "n", "<esc>ngn");
vim.keymap.set({ "n", "x" }, "N", "<esc>gNgN<esc>gn");

vim.keymap.set("n", ">", ">>")
vim.keymap.set("n", "<", "<<")

-- Insert mode navigation
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move cursor left" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move cursor down" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move cursor up" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move cursor right" })

-- Load multicursor keymaps
require('config.multicursor')

if vim.g.vscode then
  vim.keymap.set({ "n", "x" }, "<C-w>", "<cmd>lua require('vscode').action('workbench.action.closeActiveEditor')<cr>", { desc = "Close current tab", nowait = true })
else
  vim.keymap.set({ "n", "x" }, "<C-w>", "<cmd>tabclose<cr>", { desc = "Close current tab", nowait = true })

  vim.keymap.set({ "n", "x" }, "U", "<C-r>", { desc = "Redo" }) 
end