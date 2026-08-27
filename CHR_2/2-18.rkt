#lang sicp
(define (reverse list1)
  (if (null? list1)
      nil
      (append (reverse (cdr list1)) (list (car list1)) )))
(define x (list 1 2 3 4))
(reverse x)
