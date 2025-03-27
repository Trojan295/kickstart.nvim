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
      local home = os.getenv 'HOME'
      local f = assert(io.open(home .. '/.config/theme', 'r'))
      local theme = f:read('*all'):gsub('\n', '')
      f:close()

      if theme == 'light' then
        print 'Using dawnfox'
        vim.cmd 'colorscheme dawnfox'
      elseif theme == 'dark' then
        vim.cmd 'colorscheme nordfox'
      end
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
  {
    'towolf/vim-helm',
  },
  {
    'tenxsoydev/size-matters.nvim',
  },
  {
    'zbirenbaum/copilot.lua',
    config = function()
      require('copilot').setup {
        --suggestion = {
        --  enabled = true,
        --  auto_trigger = true,
        --},
      }
    end,
  },
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    version = false, -- Never set this value to "*"! Never!
    opts = {
      provider = 'copilot',
      auto_suggestions_provider = 'copilot',

      behaviour = {
        auto_suggestions = true,
      },
      mappings = {
        suggestion = {
          accept = '<Tab>',
        },
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = 'make',
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below dependencies are optional,
      'zbirenbaum/copilot.lua', -- for providers='copilot'
      {
        -- support for image pasting
        'HakonHarnes/img-clip.nvim',
        event = 'VeryLazy',
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'markdown', 'Avante' },
        },
        ft = { 'markdown', 'Avante' },
      },
    },
  },
}
