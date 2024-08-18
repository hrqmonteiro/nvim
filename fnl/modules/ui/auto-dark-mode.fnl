[{1 "f-person/auto-dark-mode.nvim"
  :config {:set_dark_mode (fn [] (vim.api.nvim_set_option :background :dark)
                            (vim.cmd "colorscheme catppuccin-macchiato"))
           :set_light_mode (fn [] (vim.api.nvim_set_option :background :light)
                             (vim.cmd "colorscheme catppuccin"))
           :update_interval 1000}}]                            	
