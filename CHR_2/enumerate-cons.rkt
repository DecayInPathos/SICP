#lang sicp
(define (accumulate op initial sequence)
        (cond((null? sequence)initial)
	      (else (op (car sequence)
		        (accumulate op initial (cdr sequence))))))
(define (enumerate-interval low high)
        (if (> low high)
	    nil
	    (cons low (enumerate-interval (+ low 1) high))))
(define (enumerate-cons n)
        (accumulate append
		    nil
		    (map (lambda (i)
	                         (map (lambda (j) (list i j))
				      (enumerate-interval 1 (-  i 1))))
				 (enumerate-interval 1 n))))
(enumerate-cons 7)
