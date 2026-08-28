#lang sicp
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))
(length (list (list 0 1)  2 3))
