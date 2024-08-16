[{1 :nvim-telescope/telescope.nvim
  :config (fn []
            ((. (require :telescope) :setup) {:defaults {:dynamic_preview_title true
                                                         :entry_prefix "  "
                                                         :file_ignore_patterns [:.git/
                                                                                :^node_modules/
                                                                                :.clj-kondo/]
                                                         :layout_config {:height 0.8
                                                                         :horizontal {:preview_cutoff 120
                                                                                      :preview_width 0.55
                                                                                      :prompt_position :top
                                                                                      :vertical {:mirror false}
                                                                                      :width 0.87}}
                                                         :layout_strategy :flex
                                                         :prompt_prefix "   "
                                                         :selection_caret "  "
                                                         :sorting_strategy :ascending}
                                              :extensions {:emoji {:action (fn [emoji]
                                                                             (vim.api.nvim_put [emoji.value]
                                                                                               :c
                                                                                               false
                                                                                               true))}}
                                              :pickers {:oldfiles {:prompt_title "Recent Files"}}})
            ((. (require :telescope) :load_extension) :bookmarks)
            ((. (require :telescope) :load_extension) :emoji)
            ((. (require :telescope) :load_extension) :file_browser)
            ((. (require :telescope) :load_extension) :media)
            ((. (require :telescope) :load_extension) :telescope-tabs)
            ((. (require :telescope) :load_extension) :ui-select)
            ((. (require :telescope-tabs) :setup) {:entry_formatter (fn [tab-id
                                                                         buffer-ids
                                                                         file-names
                                                                         file-paths
                                                                         is-current]
                                                                      (local entry-string
                                                                             (table.concat (vim.tbl_map (fn [v]
                                                                                                          (vim.fn.fnamemodify v
                                                                                                                              ":."))
                                                                                                        file-paths)
                                                                                           ", "))
                                                                      (string.format "%d: %s%s"
                                                                                     tab-id
                                                                                     entry-string
                                                                                     (or (and is-current
                                                                                              " <")
                                                                                         "")))})
            ((. (require :bookmarks) :setup) {:keywords {"@f" "⛏ "
                                                         "@n" " "
                                                         "@t" "☑️ "
                                                         "@w" "⚠️ "}
                                              :on_attach (fn [bufnr]
                                                           (local bm
                                                                  (require :bookmarks))
                                                           (local map
                                                                  vim.keymap.set)
                                                           (map :n :mm
                                                                bm.bookmark_toggle)
                                                           (map :n :mi
                                                                bm.bookmark_ann)
                                                           (map :n :mc
                                                                bm.bookmark_clean)
                                                           (map :n :mn
                                                                bm.bookmark_next)
                                                           (map :n :mp
                                                                bm.bookmark_prev)
                                                           (map :n :ml
                                                                bm.bookmark_list))
                                              :save_file (vim.fn.expand :$HOME/.bookmarks)}))
  :dependencies [:nvim-lua/plenary.nvim
                 :xiyaowong/telescope-emoji.nvim
                 :tomasky/bookmarks.nvim
                 :nvim-telescope/telescope-ui-select.nvim
                 :nvim-telescope/telescope-file-browser.nvim
                 :dharmx/telescope-media.nvim
                 :LukasPietzschmann/telescope-tabs]}]	
