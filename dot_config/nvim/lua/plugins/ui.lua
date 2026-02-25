return {
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true,
        dimInactive = false,
        terminalColors = true,
        colors = {
          palette = {},
          theme = {
            wave = {},
            lotus = {},
            dragon = {},
            all = { ui = { bg_gutter = 'none' } },
          },
        },
        overrides = function(colors)
          return {
            BlinkCmpMenu = { bg = colors.palette.dragonBlack3 },
            BlinkCmpLabelDetail = { bg = colors.palette.dragonBlack3 },
            BlinkCmpMenuSelection = { bg = colors.palette.waveBlue1 },
            SnacksDashboardHeader = { fg = colors.palette.autumnRed },
            SnacksDashboardIcon = { fg = colors.palette.autumnRed },
            SnacksDashboardKey = { fg = colors.palette.sakuraPink },
            SnacksDashboardFooter = { fg = colors.palette.surimiOrange },
          }
        end,
        theme = 'dragon',
        background = {
          dark = 'dragon',
          light = 'lotus',
        },
      }
      vim.cmd 'colorscheme kanagawa'
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function()
      -- Get Kanagawa colors
      local colors = require('kanagawa.colors').setup { theme = 'dragon' }

      -- Create custom red theme
      local custom_theme = {
        normal = {
          a = { bg = colors.palette.autumnRed, fg = colors.palette.dragonBlack0, gui = 'bold' },
          b = { bg = colors.palette.dragonBlack3, fg = colors.palette.autumnRed },
          c = { bg = colors.palette.dragonBlack1, fg = colors.palette.dragonWhite },
        },
        insert = {
          a = { bg = colors.palette.sakuraPink, fg = colors.palette.dragonBlack0, gui = 'bold' },
          b = { bg = colors.palette.dragonBlack3, fg = colors.palette.sakuraPink },
        },
        visual = {
          a = { bg = colors.palette.surimiOrange, fg = colors.palette.dragonBlack0, gui = 'bold' },
          b = { bg = colors.palette.dragonBlack3, fg = colors.palette.surimiOrange },
        },
        replace = {
          a = { bg = colors.palette.waveRed, fg = colors.palette.dragonBlack0, gui = 'bold' },
          b = { bg = colors.palette.dragonBlack3, fg = colors.palette.waveRed },
        },
        command = {
          a = { bg = colors.palette.boatYellow2, fg = colors.palette.dragonBlack0, gui = 'bold' },
          b = { bg = colors.palette.dragonBlack3, fg = colors.palette.boatYellow2 },
        },
        inactive = {
          a = { bg = colors.palette.dragonBlack1, fg = colors.palette.dragonGray },
          b = { bg = colors.palette.dragonBlack1, fg = colors.palette.dragonGray },
          c = { bg = colors.palette.dragonBlack1, fg = colors.palette.dragonGray },
        },
      }

      return {
        options = {
          icons_enabled = true,
          theme = custom_theme,
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      }
    end,
  },
  -- lazy.nvim
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
  },
}
