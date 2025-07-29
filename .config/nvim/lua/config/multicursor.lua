if not vim.g.vscode then
  return {}
end

local multicursor = require('vscode-multi-cursor')
local STATE = require('vscode-multi-cursor.state')

-- multicursor if in visual line mode
vim.keymap.set("x", "I", function()
if vim.fn.mode() == "V" then
    return "mi"
else
    return "I"
end
end, { remap = true, nowait = true, expr = true })

vim.keymap.set("x", "A", function()
if vim.fn.mode() == "V" then
    return "ma"
else
    return "A"
end
end, { remap = true, nowait = true, expr = true })

-- Conditional multicursor insert
-- prepend text
vim.keymap.set("n", "i", function()
if #STATE.cursors > 0 then
    multicursor.start_left()
    vim.defer_fn(function()
        require('vscode').action('cursorLeft')
    end, 10)
    return ""
else
    return "i"
end
end, { expr = true, desc = "Insert or multicursor insert" })

-- append text
vim.keymap.set("n", "a", function()
if #STATE.cursors > 0 then
    multicursor.start_right()
    vim.defer_fn(function()
        require('vscode').action('cursorRight')
    end, 10)
    return ""
else
    return "a"
end
end, { expr = true, desc = "Append or multicursor append" })

-- replace text
vim.keymap.set("n", "c", function()
if #STATE.cursors > 0 then
    return multicursor.start_right()
else
    return "c"
end
end, { expr = true, desc = "replace or multicursor replace" })

vim.keymap.set({ 'n', 'x' }, 'mc', multicursor.create_cursor, { expr = true, desc = 'Create cursor' })

vim.keymap.set('n', 'W', function()
    if #STATE.cursors > 0 then
        -- If multicursor exist, find next occurrence and add it
        return "/<C-r>z<CR>gnmc<cmd>nohl<cr>"
    else
        -- If no multicursor, select current word and create first multicursor
        return "siw\"zygvmc<cmd>nohl<cr>"
    end
end, { remap = true, expr = true, desc = "Multicursor word" })

vim.keymap.set('x', 'W', "\"zygvmc", { remap = true, desc = "Multicursor selection" })

vim.keymap.set({ "x", "n" }, "<esc>", function()
    if #STATE.cursors > 0 then
        multicursor.cancel()
    end

    -- Check if there's a search highlight and clear it
    if vim.v.hlsearch == 1 then
        vim.cmd('nohl')
    end

    return "<esc>"
end, { expr = true, desc = "Escape and cancel multicursor" })
