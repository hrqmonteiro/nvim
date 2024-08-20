(set vim.g.mapleader " ")
(set vim.g.maplocalleader " ")
[{1 :nvimtools/hydra.nvim
        :config (fn []
            (local Hydra (require :hydra))
            (local gitsigns (require :gitsigns))
            (local git-hint "                  Git
  ^
  _J_: next hunk\t  _d_: show deleted
  _K_: prev hunk\t  _u_: undo last stage
  _s_: stage hunk\t  _/_: show base file
  _p_: preview hunk\t_S_: stage buffer
  _b_: blame line\t  _B_: blame show full
  ^
      _<Enter>_: Neogit\t _q_: Exit
")
            (Hydra {:body :<leader>gh
                    :config {:buffer vim.bufnr
                             :color :red
                             :hint {:float_opts {:border :solid :width 40}
                                    :position :middle}
                             :invoke_on_body true
                             :on_enter (fn [] (vim.cmd :mkview)
                                         (vim.cmd "silent! %foldopen!")
                                         (gitsigns.toggle_linehl true))
                             :on_exit (fn []
                                        (local cursor-pos
                                               (vim.api.nvim_win_get_cursor 0))
                                        (vim.cmd :loadview)
                                        (vim.api.nvim_win_set_cursor 0
                                                                     cursor-pos)
                                        (vim.cmd "normal zv")
                                        (gitsigns.toggle_linehl false)
                                        (gitsigns.toggle_deleted false))
                             :on_key (fn [] (vim.wait :50))}
                    :heads [[:J
                             (fn []
                               (when vim.wo.diff (lua "return \"]c\""))
                               (vim.schedule (fn [] (gitsigns.next_hunk)))
                               :<Ignore>)
                             {:desc "next hunk" :expr true}]
                            [:K
                             (fn []
                               (when vim.wo.diff (lua "return \"[c\""))
                               (vim.schedule (fn [] (gitsigns.prev_hunk)))
                               :<Ignore>)
                             {:desc "prev hunk" :expr true}]
                            [:s
                             ":Gitsigns stage_hunk<CR>"
                             {:desc "stage hunk" :silent true}]
                            [:u
                             gitsigns.undo_stage_hunk
                             {:desc "undo last stage"}]
                            [:S gitsigns.stage_buffer {:desc "stage buffer"}]
                            [:p gitsigns.preview_hunk {:desc "preview hunk"}]
                            [:d
                             gitsigns.toggle_deleted
                             {:desc "toggle deleted" :nowait true}]
                            [:b gitsigns.blame_line {:desc :blame}]
                            [:B
                             (fn [] (gitsigns.blame_line {:full true}))
                             {:desc "blame show full"}]
                            ["/"
                             gitsigns.show
                             {:desc "show base file" :exit true}]
                            [:<Enter>
                             :<Cmd>Neogit<CR>
                             {:desc :Neogit :exit true}]
                            [:q nil {:desc :exit :exit true :nowait true}]]
                    :hint git-hint
                    :mode [:n :x]
                    :name :+git}))}]
