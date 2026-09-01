#lang sicp
(define (odd? n)
  (not(= (remainder n 2) 0)))
(define (square x)(* x x))
(define (map-before proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
	    (map proc (cdr items)))))
(define (filter predicate sequence)
  (cond ((null? sequence) nil)
	((predicate (car sequence))
	      (cons(car sequence)
		   (filter predicate (cdr sequence))))
	(else(filter predicate (cdr sequence)))))
(define (accumulate op initial sequence)
        (cond((null? sequence)initial)
	      (else (op (car sequence)
		        (accumulate op initial (cdr sequence))))))
(define (enumerate-interval low high)
        (if (> low high)
	    nil
	    (cons low (enumerate-interval (+ low 1) high))))
(define (enumerate-tree tree)
        (cond ((null? tree) nil)
	      ((not (pair? tree)) (list tree))
	      (else (append (enumerate-tree (car tree))
		            (enumerate-tree (cdr tree))))))


;-----------------------2-33--------------------------------
;
(define (map p sequence)
        (accumulate (lambda (x y) (cons (p x) y)) 
		    nil
		    sequence))
(map (lambda (x) (* x x)) (list 1 2 3))

(define (append seq1 seq2)
        (accumulate cons seq2 seq1 ))
(append (list 1 2 3) (list 4 5 6))

(define (length sequence)
        (accumulate (lambda (x y) (+ 1 y))  0 sequence))
(length (list 1 2 3 4))
