return {
  dir = '/Users/geoff/Documents/projects/nvim-tmux-pytest/',
  opts = {
    base_cmd = 'pytest --disable-warnings --no-migrations',
  },
  keys = {
    { '<leader>tf', '<cmd>TPRunFunction<cr>', desc = 'TP: Run current test' },
    { '<leader>tF', '<cmd>TPRunFile<cr>', desc = 'TP: Run tests for file' },
    { '<leader>tc', '<cmd>TPRunClass<cr>', desc = 'TP: Run current class tests' },
    { '<leader>tb', '<cmd>TPSetBaseCommand<cr>', desc = 'TP: Set base test command' },
    { '<leader>tw', '<cmd>TPSelectWindow<cr>', desc = 'TP: Select target window' },
  },
}
