-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
--
--make sure signature help has a nice rounded border and renders the markdown
local function bordered_signature_help(_opts)
  _opts = _opts or {}
  return vim.lsp.buf.signature_help(vim.tbl_deep_extend('force', _opts, {
    border = 'rounded',
  }))
end
-- Remove the original keybinding for <C-s> in insert mode bc it doesn't render the boreder
-- for some reason; not sure why...
vim.keymap.del({ 'i', 's' }, '<c-s>')
vim.keymap.set({ 'i', 's' }, '<c-s>', bordered_signature_help, { desc = 'Signature help' })
vim.keymap.set('n', 'gs', bordered_signature_help, { desc = 'Signature help' })
vim.keymap.set('n', 'gh', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<C-q>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Not certain what this does exactly, but used from here in telescope filenameFirst
-- https://github.com/nvim-telescope/telescope.nvim/issues/2014#issuecomment-1873229658
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'TelescopeResults',
  callback = function(ctx)
    vim.api.nvim_buf_call(ctx.buf, function()
      vim.fn.matchadd('TelescopeParent', '\t\t.*$')
      vim.api.nvim_set_hl(0, 'TelescopeParent', { link = 'Comment' })
    end)
  end,
})

-- My Changes
-- vim.keymap.set('n', '<leader>fe', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTreeToggle' })
vim.keymap.set('i', 'jj', '<ESC>', { desc = 'Exit insert mode' })

-- Beginnings and endings of lines
vim.keymap.set('n', 'H', '_', { desc = 'Move to beginning of line' })
vim.keymap.set('n', 'L', '$', { desc = 'Move to end of line' })

-- switching buffers
vim.keymap.set('n', 'J', ':bprev<CR>', { desc = 'Previous Buffer' })
vim.keymap.set('n', 'K', ':bnext<CR>', { desc = 'Next Buffer' })

-- vim: ts=2 sts=2 sw=2 et
