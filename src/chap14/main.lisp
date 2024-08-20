(defun add-widget (database widget)
  (cons widget database))

(defparameter *database* nil)

(defun main-loop ()
  (loop (princ "Please enter the name of a new widget:")
	(setf *database* (add-widget *database* (read)))
	(format t "The database contains the following: ~a~%" *database*)))

(defparameter *my-list* '(4 7 2 3))

(loop for n below (length *my-list*)
      do (setf (nth n *my-list*) (+ (nth n *my-list*) 2)))

(defun add-two (list)
  (when list
    (cons (+ 2 (car list)) (add-two (cdr list)))))

(mapcar #'(lambda (x) (+ 2 x)) '(4 7 2 3))
