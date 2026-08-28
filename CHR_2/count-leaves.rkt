#lang sicp
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))
(define (count-leaves items)
  (cond ((null? items) 0)
    ((not (pair? items)) 1)
    (+ (count-leaves (car items))
       (count-leaves (cdr items)))))
