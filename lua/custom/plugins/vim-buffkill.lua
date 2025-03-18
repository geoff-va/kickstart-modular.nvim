return {
  'qpkorr/vim-bufkill',
  keymaps = {
    vim.keymap.set('n', '<C-k>', ':BD<CR>', { desc = 'Close Current Buffer' }),
  },
}
