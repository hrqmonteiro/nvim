[{1 :levouh/tint.nvim
    :config (fn []
              (local tint (require :tint))

              (tint.setup
                {:highlight_ignore_patterns [:WinSeparator :VertSplit]
                :saturation 0
                :tint (- 45)
                ;:tint_background_colors true
                :transforms (. (. (require :tint) :transforms) :SATURATE_TINT)
                :window_ignore_function (fn [winid]
                                          (local bufid
                                                 (vim.api.nvim_win_get_buf winid))
                                          (local buftype
                                                 (vim.api.nvim_buf_get_option bufid
                                                                              :buftype))
                                          (local floating
                                                 (not= (. (vim.api.nvim_win_get_config winid)
                                                          :relative)
                                                       ""))
                                          (or (= buftype :nofile) floating))}))}]
