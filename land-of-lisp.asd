(defsystem "land-of-lisp"
  :version "0.0.1"
  :author "JunNishimura"
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "land-of-lisp/tests"))))

(defsystem "land-of-lisp/tests"
  :author "JunNishimura"
  :license ""
  :depends-on ("land-of-lisp"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for land-of-lisp"
  :perform (test-op (op c) (symbol-call :rove :run c)))
