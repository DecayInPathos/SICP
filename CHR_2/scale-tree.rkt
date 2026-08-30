#lang sicp
(define (scale-tree lst  factor)
  (cond ((null? lst)nil)
    ((number? lst) (* lst factor))
    (else(cons (scale-tree (car lst) factor)
	       (scale-tree (cdr lst) factor)))))
(define a (list 1 (list 3 4) 2))
(scale-tree a 10)
