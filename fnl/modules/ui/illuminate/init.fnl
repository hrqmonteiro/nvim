[{1 :RRethy/vim-illuminate
    :config (fn []
              (local illuminate (require :illuminate))
              
              (illuminate.configure
                {:filetypes_denylist ["neo-tree" "alpha"]}))}]
