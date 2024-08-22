[{1 :nvim-focus/focus.nvim
    :lazy false
    :priority 1001
    :setup (fn []
            (local focus (require :focus))

            (focus.setup
              {:autoresize {:enable true
                            :height 0
                            :height_quickfix 10
                            :minheight 0
                            :minwidth 0
                            :width 0}
               :commands true
               :enable true
               :split {:bufnew false :tmux false}
               :ui {:absolutenumber_unfocussed false
                    :colorcolumn {:enable false :list :+1}
                    :cursorcolumn false
                    :cursorline true
                    :hybridnumber false
                    :number false
                    :relativenumber false
                    :signcolumn true
                    :winhighlight false}}))}]
