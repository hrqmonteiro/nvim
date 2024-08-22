[{1 :NeogitOrg/neogit
  :config (fn []
            (local neogit (require :neogit))

            (neogit.setup
              {:disable_hint true
               :signs {:hunk ["" ""] :item ["" ""] :section ["" ""]}}))
  :dependencies [:nvim-lua/plenary.nvim
                 :sindrets/diffview.nvim
                 :nvim-telescope/telescope.nvim]}]
