[{1 :karb94/neoscroll.nvim
    :lazy false
    :event :VeryLazy
    :priority 1000
    :setup (fn []
             (local neoscroll (require :neoscroll))

             (neoscroll.setup
               {:cursor_scrolls_alone true}
               :easing :linear
               :hide_cursor true
               :mappings [:<C-u> :<C-d> :<C-b> :<C-f> :<C-y> :<C-e> :zt :zz :zb]
               :performance_mode false
               :post_hook nil
               :pre_hook nil
               :respect_scrolloff false
               :stop_eof true))}]
