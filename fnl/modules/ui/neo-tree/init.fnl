[{1 :nvim-neo-tree/neo-tree.nvim
    :branch :v3.x
    :config (fn []
              (local neo-tree (require :neo-tree))
              (local icons (require :config.icons))

              (neo-tree.setup
                {:close_if_last_window true
                 :default_component_configs {:git_status {:symbols {:added "+"
                                                                    :conflict ""
                                                                    :deleted "-"
                                                                    :ignored ""
                                                                    :modified "~"
                                                                    :renamed "~"
                                                                    :staged ""
                                                                    :unstaged ""
                                                                    :untracked ""}}
                                             :indent {:expander_collapsed icons.ui.ChevronShortRight
                                                      :expander_expanded icons.ui.ChevronShortDown
                                                      :expander_highlight :NeoTreeFileIcon
                                                      :with_expanders true
                                                      :with_markers false}
                                             :name {:use_git_status_colors false}}
                 :filesystem {:filtered_items {:hide_dotfiles false
                                               :hide_gitignored false
                                               :hide_hidden false}}
                 :window {:position :right
                          :width 30}}))
            :dependencies [:MunifTanjim/nui.nvim :3rd/image.nvim]}]
