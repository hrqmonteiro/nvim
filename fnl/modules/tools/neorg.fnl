[{1 :nvim-neorg/neorg
    :lazy false
    :version "*"
    :config         (fn []
                      ((. (require :neorg) :setup) {:load {:core.concealer {}}}
                                                   :core.defaults {}
                                                   :core.dirman {:config {:default_workspace :notes}}
                                                   :workspaces {:notes "~/Neorg"}))}]
