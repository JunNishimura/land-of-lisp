(if '()
    "i am true"
    "i am false")
(if '(1)
    "i am true"
    "i am false")
(defun my-length (list)
  (if list
      (1+ (my-length (cdr list)))
      0))
(if (= (+ 1 2) 3)
    'yup
    'nop)
(if (= (+ 1 2) 4)
    'yup
    'nop)
(if (oddp 5)
    'odd-number
    'even-number)
(if (oddp 5)
    'odd-number
    (/ 1 0))
(defvar *arch-enemy* nil)
(defun pudding-eater (person)
  (cond ((eq person 'henry) (setf *arch-enemy* 'stupid-lisp-alien)
                            '(curse you lisp alien - you ate my pudding))
        ((eq person 'johnny) (setf *arch-enemy* 'useless-old-johnny)
                            '(i hope you chocked on my pudding johnny))
        (t                  '(why you eat my pudding stranger?))))
(defun pudding-eater-case (person)
  (case person
    ((henry) (setf *arch-enemy* 'stupid-lisp-alien)
             '(curse you lisp alien - you ate my pudding))
    ((johnny) (setf *arch-enemy* 'useless-old-johnny)
             '(i hope you chocked on my pudding johnny))
    (otherwise '(why you eat my pudding stranger?)))
(and (oddp 5) (oddp 7) (oddp 3))
(or (oddp 5) (oddp 10) (oddp 4))
