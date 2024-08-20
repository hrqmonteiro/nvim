[{1 :folke/which-key.nvim
  :config (fn []
            ((. (require :which-key) :setup) {:icons {:breadcrumb "⟶ "
                                                      :mappings false
                                                      :separator "⟶ "}
                                              :layout {:align :left}}))
  :event :VeryLazy
  :init (fn [] (set vim.o.timeout true) (set vim.o.timeoutlen 300))
  :opts {}}]
