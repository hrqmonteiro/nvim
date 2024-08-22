[{1 :vhyrro/luarocks.nvim
    :priority 1001
    :opts {:rocks :magick}}]

[{1 :3rd/image.nvim
    :dependencies ["vhyrro/luarocks.nvim"]
    :config (fn []
              (local image (require :image))

              (image.setup
                {:backend :kitty
                 :editor_only_render_when_focused false
                 :hijack_file_patterns [:*.png :*.jpg :*.jpeg :*.gif :*.webp :*.avif]
                 :integrations {:css {:enabled false}
                                :html {:enabled false}
                                :markdown {:clear_in_insert_mode false
                                           :download_remote_images true
                                           :enabled true
                                           :filetypes [:markdown :vimwiki]
                                           :only_render_image_at_cursor false}
                                :neorg {:clear_in_insert_mode false
                                        :download_remote_images true
                                        :enabled true
                                        :filetypes [:norg]
                                        :only_render_image_at_cursor false}}
                 :max_height nil
                 :max_height_window_percentage 50
                 :max_width nil
                 :max_width_window_percentage nil
                 :tmux_show_only_in_active_window false
                 :window_overlap_clear_enabled false
                 :window_overlap_clear_ft_ignore [:cmp_menu :cmp_docs ""]}))}]

                     

                     
