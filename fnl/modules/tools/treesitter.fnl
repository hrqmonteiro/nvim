[{1 "nvim-treesitter/nvim-treesitter"
    :dependencies ["windwp/nvim-ts-autotag" "JoosepAlviste/nvim-ts-context-commentstring"]
    :config (fn []
              (local treesitter (require :nvim-treesitter.configs))

              (treesitter.setup
                {:auto_install true
                :autotag {:enable true}
                :highlight {:enable true}
                :indent {:enable true}
                })

              ((. (require :ts_context_commentstring) :setup) {:enable_autocmd false})	

              (local get-option vim.filetype.get_option)
              (set vim.filetype.get_option
                   (fn [filetype option]
                     (or (and (= option :commentstring)
                              ((. (require :ts_context_commentstring.internal)
                                  :calculate_commentstring)))
                         (get-option filetype option))))	 

              )}]
