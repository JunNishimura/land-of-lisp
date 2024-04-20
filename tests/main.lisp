(defpackage land-of-lisp/tests/main
  (:use :cl
        :land-of-lisp
        :rove))
(in-package :land-of-lisp/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :land-of-lisp)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
