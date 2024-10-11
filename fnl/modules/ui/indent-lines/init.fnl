[{1 :lukas-reineke/indent-blankline.nvim
  :config (fn []
            ((. (require :ibl) :setup) {:enabled false
                                        :indent {:char "│"}
                                        :scope {:char "│"}
                                        :exclude {:buftypes [:terminal :nofile]
                                                  :filetypes [:help
                                                              :startify
                                                              :dashboard
                                                              :lazy
                                                              :neogitstatus
                                                              :NvimTree
                                                              :Trouble
                                                              :text]}
                                        :scope {:enabled true
                                                :include {:node_type {:* ["*"]}}
                                                :show_start false}})
            (local hooks (require :ibl.hooks))
            (hooks.register hooks.type.SCOPE_HIGHLIGHT
                            hooks.builtin.scope_highlight_from_extmark))
  :main :ibl}]
