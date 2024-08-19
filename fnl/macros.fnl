(fn packages! [...]
  (let [result {}
        args [...]]
    (for [i 1 (length args) 2]
      (local category (. args i))
      (local modules (. args (+ i 1)))
      (when (and (= (type category) :string) (= (type modules) :table))
        (tset result category modules)))
    result))

{: packages!}
