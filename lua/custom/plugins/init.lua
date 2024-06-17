return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      vim.keymap.set('n', '<F2>', ':Neotree focus<CR>')
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
      vim.cmd 'colorscheme dawnfox'
      local timer = vim.loop.new_timer()

      timer:start(
        0,
        1000,
        vim.schedule_wrap(function()
          local hour = os.date('*t').hour
          local colorscheme = (hour >= 8 and hour <= 20) and 'dawnfox' or 'nordfox'

          vim.cmd('colorscheme ' .. colorscheme)
        end)
      )
    end,
  },
  {
    'kdheepak/lazygit.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
  },
}
