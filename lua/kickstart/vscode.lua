-- VSCode keybindings and settings

vim.opt.clipboard = 'unnamedplus' -- use system clipboard

-- Searching
vim.opt.incsearch = true -- search as characters are entered
-- vim.opt.hlsearch = false -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered

vim.keymap.set('n', 'H', '_', { desc = 'Move to beginning of line' })
vim.keymap.set('n', 'L', '$', { desc = 'Move to end of line' })
vim.keymap.set('i', 'jj', '<ESC>', { desc = 'Exit insert mode' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', 'gr', function()
  require('vscode').call 'references-view.findReferences'
end)
vim.keymap.set('n', ',rn', function()
  require('vscode').call 'editor.action.rename'
end)
vim.keymap.set('n', ',lg', function()
  require('vscode').call 'lazygit-vscode.toggle'
end)
vim.keymap.set('n', '<leader>ca', function()
  require('vscode').call('edit.action.refactor', { silent = true })
end)
vim.keymap.set('n', ',fe', function()
  require('vscode').call 'workbench.explorer.fileView.focus'
end)
vim.keymap.set('n', 'J', function()
  require('vscode').call 'workbench.action.previousEditor'
end)
vim.keymap.set('n', 'K', function()
  require('vscode').call 'workbench.action.nextEditor'
end)
vim.keymap.set('n', ',sf', function()
  require('vscode').call 'find-it-faster.findFiles'
end)
vim.keymap.set('n', ',sg', function()
  require('vscode').call 'find-it-faster.findWithinFiles'
end)
vim.keymap.set('n', ',ws', function()
  require('vscode').call 'workbench.action.showAllSymbols'
end)
vim.keymap.set('n', ',ds', function()
  require('vscode').call 'workbench.action.gotoSymbol'
end)
