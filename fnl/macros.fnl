(fn packages! [...]
  {:fnl/arglist [:category1 module1 ...]
   :fnl/docstring "blah blah blah"}
  (assert-compile (= :string (type (pick-values 1 ...)))
                  "first argument must be a string (category)"
                  (pick-values 1 ...))
  (accumulate [(categories cat) (values {} nil) i v (ipairs [...])]
    (if (sym? v)
        (do
          (table.insert (. categories cat) (tostring v))
          (values categories cat))
        (= :string (type v))
        (do
          (assert-compile (= nil (. categories v))
                          "each category must appear only once")
          (tset categories v [])
          (values categories v))
        (sequence? v)
        (let [type-msg "module specs must all be syms"
              mod (tostring (assert-compile (sym? (. v 1)) type-msg v))]
          (table.insert (. categories cat) mod)
          (for [i 2 (length v)]
            (table.insert (. categories cat)
                          (->> (assert-compile (sym? (.  v i)) type-msg v)
                               (tostring)
                               (.. mod "."))))
          (values categories cat))
        ;; neither string nor sym
        (assert-compile false
                        "packages! only allows strings (category) and modnames (sym)"
                        v))))

{: packages!}
