[{1 :kosayoda/nvim-lightbulb
    :config (fn []
              ((. (require :nvim-lightbulb) :setup) {:autocmd {:enabled true}
                                                    :float {:enabled false}
                                                    :sign {:enabled false}
                                                    :virtual_text {:enabled true
                                                    :text ""}})
              (vim.cmd "hi! link LightBulbVirtualText GitSignsChange"))}]	
