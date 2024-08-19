(import-macros {: packages!} :macros)

(packages!
  :ui [
       "alpha" 
       "auto-dark-mode"
       "colorscheme"
       "gitsigns"
       "hydra"
       "lualine"
       "neo-tree"
       "noice" 
       "web-devicons"
       "which-key"
       ]

  :completion [
               "cmp"
               "telescope"
               ]

  :lsp [
        "lspconfig"
        "mason"
        "nvim-lightbulb"
        ]

  :tools [
          "conjure"
          "neogit"
          "neorg"
          "tangerine"
          "tmux-navigator"
          "toggleterm"
          "treesitter"
          ])
