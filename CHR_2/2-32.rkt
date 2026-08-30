#lang sicp
(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
	    (map proc (cdr items)))))
(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (a) (begin (append (list (car a)))(append nil)))  rest)))))
(subsets (list 1 3 4 ))

