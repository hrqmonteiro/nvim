[{1 :kosayoda/nvim-lightbulb
    :config (fn []
              (local lightbulb (require :nvim-lightbulb))
              (local icons (require :config.icons))

              (lightbulb:setup
                {:autocmd {:enabled true}}
                :float {:enabled false}
                :sign {:enabled false}
                :virtual_text {:enabled true}
                :text "a")
              (vim.cmd "hi! link LightBulbVirtualText GitSignsChange"))}]
