#lang sicp
(define (sum-odd-square tree)
  (cond((null? tree)0)
    ((not (pair? tree))
     (if (odd? tree) (square tree) 0))
    (else (+ (sum-odd-square (car tree))
	     (sum-odd-square (cdr tree))))))
