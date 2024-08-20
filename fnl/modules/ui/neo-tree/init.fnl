[{1 :nvim-neo-tree/neo-tree.nvim
  :branch :v3.x
  :config (fn []
            ((. (require :neo-tree) :setup) {:close_if_last_window true
                                             :default_component_configs {:git_status {:symbols {:added "+"
                                                                                                :conflict ""
                                                                                                :deleted "-"
                                                                                                :ignored ""
                                                                                                :modified "~"
                                                                                                :renamed "~"
                                                                                                :staged ""
                                                                                                :unstaged ""
                                                                                                :untracked ""}}
                                                                         :indent {:expander_collapsed ""
                                                                                  :expander_expanded ""
                                                                                  :expander_highlight :NeoTreeFileIcon
                                                                                  :with_expanders true
                                                                                  :with_markers false}
                                                                         :name {:use_git_status_colors false}}
                                             :filesystem {:filtered_items {:hide_dotfiles false
                                                                           :hide_gitignored false
                                                                           :hide_hidden false}}
                                             :window {:position :right
                                                      :width 30}}))
  :dependencies [:nvim-lua/plenary.nvim :MunifTanjim/nui.nvim :3rd/image.nvim]}]	
