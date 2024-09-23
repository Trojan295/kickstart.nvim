return {
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {}

      vim.keymap.set('n', '<F2>', ':NvimTreeFindFile<Enter>')
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      open_mapping = [[<c-\>]],
      autochdir = true,
    },
  },
  {
    'EdenEast/nightfox.nvim',
    config = function()
      vim.cmd 'colorscheme nordfox'
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  {
    'ray-x/lsp_signature.nvim',
    event = 'VeryLazy',
    opts = {},
    config = function(_, opts)
      require('lsp_signature').setup(opts)
    end,
  },
  {
    'nvim-neotest/neotest',
    config = function(_, opts)
      opts.adapters = {
        require 'neotest-go',
      }

      require('neotest').setup(opts)

      vim.keymap.set('n', '<leader>trr', ":lua require('neotest').run.run()<enter>", { desc = 'Run nearest tests' })
      vim.keymap.set('n', '<leader>trf', ":lua require('neotest').run.run(vim.fn.expand('%'))<enter>", { desc = 'Run tests in file' })
      vim.keymap.set('n', '<leader>too', ":lua require('neotest').output.open()<enter>", { desc = 'Open test output' })
      vim.keymap.set('n', '<leader>ts', ":lua require('neotest').summary.toggle()<enter>", { desc = 'Toggle test summary' })
    end,
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-go',
    },
  },

  {
    'folke/trouble.nvim',
    opts = {},
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
}
