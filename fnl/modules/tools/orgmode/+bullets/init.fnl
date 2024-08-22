[{1 :akinsho/org-bullets.nvim
    :lazy false
    :setup (fn []
             (local org-bullets (require :org-bullets))

             (org-bullets.setup
               {:concealcursor false}
               :symbols {:checkboxes {:done ["✓" "@org.keyword.done"]}}
               :half ["" "@org.checkbox.halfchecked"]
               :todo ["˟" "@org.keyword.todo"]
               :headlines false
               :list "•"))}]
