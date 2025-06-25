-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
---@type LazyPluginSpec
return {
  'stevearc/oil.nvim',

  -- Oil should not be lazy-loaded to ensure it replaces netrw properly
  lazy = false,

  -- Optional dependencies (use one or the other)
  dependencies = {
    { 'echasnovski/mini.icons', opts = {} },
    -- Alternatively, if you prefer web-devicons instead of mini.icons
    -- "nvim-tree/nvim-web-devicons",
  },

  opts = {
    default_file_explorer = true, -- Replace netrw
    use_default_keymaps = false, -- We define custom keymaps below
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ['<CR>'] = 'actions.select',
      ['<C-v>'] = 'actions.select_vsplit',
      ['<C-x>'] = 'actions.select_split',
      ['<C-t>'] = 'actions.select_tab',
      ['<BS>'] = 'actions.parent',
      ['q'] = 'actions.close',
      ['g?'] = 'actions.show_help',
    },
  },

  config = function(_, opts)
    require('oil').setup(opts)

    -- Optional keymap: open Oil in current directory with "-"
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory in Oil' })

    -- Optional: floating window version
    vim.keymap.set('n', '<leader>e', function()
      require('oil').open_float()
    end, { desc = 'Open Oil (floating)' })
  end,
}
