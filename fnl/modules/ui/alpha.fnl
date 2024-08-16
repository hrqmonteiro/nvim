[{1 :goolord/alpha-nvim
  :config (fn []
            (local alpha (require :alpha))
            (local doom
                   ["=================     ===============     ===============   ========  ========"
                    "\\\\ . . . . . . .\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . //"
                    "||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||"
                    "|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||"
                    "||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||"
                    "|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||"
                    "||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||"
                    "|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||"
                    "||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||"
                    "||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||"
                    "||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||"
                    "||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||"
                    "||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||"
                    "||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||"
                    "||   .=='    _-'          '-__\\._-'         '-_./__-'         `' |. /|  |   ||"
                    "||.=='    _-'                                                     `' |  /==.||"
                    "=='    _-'                        N E O V I M                         \\/   `=="
                    "\\   _-'                                                                `-_   /"
                    " `''                                                                      ``' "])
            (local hydra
                   ["                                   "
                    "                                   "
                    "                                   "
                    "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          "
                    "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       "
                    "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     "
                    "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    "
                    "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   "
                    "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  "
                    "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   "
                    " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  "
                    " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ "
                    "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     "
                    "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     "
                    "                                   "])

            (fn button [sc txt keybind]
              (local sc- (: (sc:gsub "%s" "") :gsub :SPC :<leader>))
              (local opts {:align_shortcut :right
                           :cursor 4
                           :hl :helpSpecial
                           :hl_shortcut :String
                           :padding 40
                           :position :center
                           :shortcut sc
                           :width 45})
              (when keybind
                (set opts.keymap
                     [:n sc- keybind {:noremap true :nowait true :silent true}]))

              (fn on-press []
                (local key
                       (vim.api.nvim_replace_termcodes (or keybind
                                                           (.. sc- :<Ignore>))
                                                       true false true))
                (vim.api.nvim_feedkeys key :t false))

              {:on_press on-press : opts :type :button :val txt})

            (local sections {:buttons {:opts {:spacing 1}
                                       :type :group
                                       :val [(button " SPC f r  "
                                                     "   Recently opened files"
                                                     ":Telescope oldfiles<CR>")
                                             (button " SPC q l  "
                                                     "   Reload last session"
                                                     ":Telescope oldfiles<CR>")
                                             (button " SPC o A  "
                                                     "   Open norg agenda"
                                                     ":Telescope oldfiles<CR>")
                                             (button " SPC p p  "
                                                     "   Open project"
                                                     ":Telescope project<CR>")
                                             (button " SPC RET  "
                                                     "   Jump to bookmark"
                                                     ":Telescope bookmarks list<CR>")
                                             (button " SPC f P  "
                                                     "   Open private configuration"
                                                     ":Telescope oldfiles<CR>")
                                             (button " SPC h d h"
                                                     "   Open documentation"
                                                     ":Telescope oldfiles<CR>")]}
                             :header {:opts {:hl :Comment :position :center}
                                      :type :text
                                      :val hydra}
                             :icon {:on_press (fn []
                                                (if (= (vim.fn.has :mac) 1)
                                                    (os.execute "open https://github.com/nyoom-engineering/nyoom.nvim")
                                                    (os.execute "xdg-open https://github.com/nyoom-engineering/nyoom.nvim")))
                                    :opts {:hl :Decorator :position :center}
                                    :type :button
                                    :val ""}})
            (alpha.setup {:layout [{:type :padding :val 4}
                                   sections.header
                                   ; {:type :padding :val 1}
                                   ; sections.buttons
                                   ; {:type :padding :val 1}
                                   ; sections.footer
                                   {:type :padding :val 4}
                                   ; sections.icon
                                   ]}))}]
