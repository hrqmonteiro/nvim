[{1 :lewis6991/gitsigns.nvim
  :config (fn []
            ((. (require :gitsigns) :setup) {:signs {:add {:text "+"}
                                                     :change {:text "~"}
                                                     :changedelete {:text "~"}
                                                     :delete {:text "-"}
                                                     :topdelete {:text "-"}
                                                     :untracked {:text "┆"}}}))}]
