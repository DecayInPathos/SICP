#lang sicp
(define x  (list 1 (list 2 (list 3 4))))
(car x)
(car(car(cdr x)))
(car(car(cdr(car(cdr x)))))
