#lang sicp
(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
	    (map proc (cdr items)))))
(map (lambda (a) (+ a 1)) (list 1 2 3 4))
