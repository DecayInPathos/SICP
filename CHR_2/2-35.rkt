#lang sicp
(define (enumerate-tree tree)
        (cond ((null? tree) nil)
	      ((not (pair? tree)) (list tree))
	      (else (append (enumerate-tree (car tree))
		            (enumerate-tree (cdr tree))))))
(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
	    (map proc (cdr items)))))
(define (accumulate op initial sequence)
        (cond((null? sequence)initial)
	      (else (op (car sequence)
		        (accumulate op initial (cdr sequence))))))
(define (count-leaves t)
  (accumulate (lambda (x y) (+ 1 y)) 0  (map (lambda (a) a) (enumerate-tree t))))
(count-leaves (list 1(list 2 3)3))

