#lang sicp
(define (odd? n)
  (not(= (remainder n 2) 0)))
(define (square x)(* x x))
(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
	    (map proc (cdr items)))))
(map square (list 1 2 3 4 5))
(define (filter predicate sequence)
  (cond ((null? sequence) nil)
	((predicate (car sequence))
	      (cons(car sequence)
		   (filter predicate (cdr sequence))))
	(else(filter predicate (cdr sequence)))))
(filter odd? (list 1 2 3 4 5 6 7))
(define (accumulate op initial sequence)
        (cond((null? sequence)initial)
	      (else (op (car sequence)
		        (accumulate op initial (cdr sequence))))))
(accumulate + 0 (list 1 2 3 4 5))
(define (enumerate-interval low high)
        (if (> low high)
	    nil
	    (cons low (enumerate-interval (+ low 1) high))))
(enumerate-interval 1 2)
(define (enumerate-tree tree)
        (cond ((null? tree) nil)
	      ((not (pair? tree)) (list tree))
	      (else (append (enumerate-tree (car tree))
		            (enumerate-tree (cdr tree))))))
(enumerate-tree (list 1 (list 2 3 ) 4))
(define (sum-odd-square tree)
        (accumulate(+
		    0
		    (map square 
	                 (filter odd?
			         (enumerate-tree tree))))))

