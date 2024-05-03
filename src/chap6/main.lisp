(print "Hello, World!")

(progn (print "this")
       (print "is")
       (print "a")
       (print "test"))

(progn (prin1 "this")
       (prin1 "is")
       (prin1 "a")
       (prin1 "test"))

(progn (print "flip") (prin1 "flop"))

(defun say-hello ()
    (print "Please type yoru name:")
    (let ((name (read)))
      (print "Nice to meet you, ")
      (print name)))

(say-hello)

(defun add-five()
  (print "please enter a number:")
  (let ((number (read)))
    (print "When I add five I get")
    (print (+ number 5))))

(add-five)

(progn (princ "this sentence will be interpreted")
       (princ #\newline)
       (princ "by an annoying newline character"))

(defun say-hello2 ()  (princ "please type your name:")
  (let ((name (read-line)))
    (princ "nice to meet you, ")
    (princ name)))

(defparameter *foo* '(+ 1 2))

(defun game-repl ()
  (let ((cmd (game-read)))
    (unless (eq (car cmd) 'quit)
      (game-print (game-eval cmd))
      (game-repl))))

(defun game-read ()
  (let ((cmd (read-from-string
              (concatenate 'string "(" (read-line) ")"))))
    (flet ((quote-it (x)
             (list 'quote x)))
      (cons (car cmd) (mapcar #'quote-it (cdr cmd))))))

(defparameter *allowed-commands* '(look walk pickup inventory))

(defun game-eval (sexp)
  (if (member (car sexp) *allowed-commands*)
      (eval sexp)
      '(i do not know that command)))

(defun tweak-text (lst caps lit)
  (when lst
    (let ((item (car lst))
          (rest (cdr lst)))
      (cond ((eql item #\space) (cons item (tweak-text rest caps lit)))
            ((member item '(#\! #\? #\.)) (cons item (tweak-text rest t lit)))
            ((eql item #\") (tweak-text rest caps (not lit)))
            (lit (cons item (tweak-text rest nil lit)))
            (caps (cons (char-upcase item) (tweak-text rest nil lit)))
            (t (cons (char-downcase item) (tweak-text rest nil nil)))))))

(defun game-print (lst)
  (princ (coerce (tweak-text (coerce (string-trim "() "
                                                  (prin1-to-string lst))
                                     'list)
                             t
                             nil)
                 'string))
  (fresh-line))
