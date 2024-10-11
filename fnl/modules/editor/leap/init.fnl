{1 :ggandor/leap.nvim
         :config (fn [_ opts]
                   (local leap (require :leap))
                   (each [k v (pairs opts)] (tset leap.opts k v))
                   (leap.add_default_mappings true)
                   (vim.keymap.del [:x :o] :x)
                   (vim.keymap.del [:x :o] :X))
         :enabled true
         :keys [{1 :s :desc "Leap Forward to" :mode [:n :x :o]}
                {1 :S :desc "Leap Backward to" :mode [:n :x :o]}
                {1 :gs :desc "Leap from Windows" :mode [:n :x :o]}]}
