;; (defun add (a b)
;;   (let ((x (+ a b)))
;;     (format t "The sum is ~a" x)
;;     x))

(defmacro let1 (var val &body body)
  `(let ((,var ,val))
     ,@body))

(let1 foo (+ 2 3)
  (* foo foo))

(let1 foo (+ 2 3)
  (princ "Lisp is awesome")
  (* foo foo))

(defun add (a b)
  (let1 x (+ a b)
    (format t "The sum is ~a" x)
    x))

(defun my-length (lst)
  (labels ((f (lst acc)
	     (if lst
		 (f (cdr lst) (1+ acc))
		 acc)))
    (f lst 0)))

(defmacro split (val yes no)
  `(if ,val
       (let ((head (car ,val))
	     (tail (cdr ,val)))
	 ,yes)
       ,no))

(split '(2 3)
       (format t "this can be split into ~a and ~a" head tail)
       (format t "this can't be split"))

(defun my-length2 (lst)
  (labels ((f (lst acc)
	     (split lst
		    (f tail (1+ acc))
		    acc)))
    (f lst 0)))

(defmacro split2 (val yes no)
  `(let1 x ,val
     (if x
	 (let ((head (car x))
	       (tail (cdr x)))
	   ,yes)
	 ,no)))

(split2 (progn (princ "hello!")
	       '(2 3))
	(format t "this can be split into ~a and ~a" head tail)
	(format t "this can't be split"))

(defmacro split3 (val yes no)
  (let1 g (gensym)
    `(let1 ,g ,val
       (if ,g
	   (let ((head (car ,g))
		 (tail (cdr ,g)))
	     ,yes)
	   ,no))))

(defun pairs (lst)
  (labels ((f (lst acc)
	     (split3 lst
		     (if tail
			 (f (cdr tail) (cons (cons (head (car tail))) acc))
			 (reverse acc))
		     (reverse acc))))
    (f lst nil)))

(defmacro rescue (vars &body body)
  (let1 p (pairs vars)
    `(labels ((self ,(mapcar #'car p)
		,@body))
       (self ,@(mapcar #'cdr p)))))

(defun my-length3 (lst)
  (rescue (lst lst
	       acc 0)
	  (split3 lst
		  (self tail (1+ acc))
		  acc)))
