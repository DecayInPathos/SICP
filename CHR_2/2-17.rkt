#lang sicp
(define (last-pair list)
  (if (null? (cdr list))
      (car list)
      (last-pair (cdr list))))
(define x (list 1 2 3 4 5 6 7))
(last-pair x)