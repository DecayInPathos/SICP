#lang sicp
(define (accumulate op initial sequence)
        (cond((null? sequence)initial)
	      (else (op (car sequence)
		        (accumulate op initial (cdr sequence))))))
(define (dot-product v w)
        (accumulate + 0 (map * v w)))
(define (matrix-*-vector m v)
	(if (null? m)
            nil
	    (cons (accumulate + 0(map * (car m) v))
	          (matrix-*-vector (cdr m) v))))

(define (first-cons seqs)
        (if (null? seqs)
	    nil
	    (cons (car (car seqs)) (first-cons (cdr seqs)))))
(define (second-cons seqs)
        (if (null? seqs)
	    nil
	    (cons (cdr(car seqs)) (second-cons (cdr seqs)))))
(define (transpose x)
	(if (null? (car x))
            nil
	    (cons (first-cons x)(transpose (second-cons x)))))

(define (matrix-*-matrix m v)
	(define (iter a b)
                (if (null? a)
		    nil
		    (cons (matrix-*-vector  b (car a))
	                  (iter  (cdr a) b))))
	(iter m (transpose v)))

(dot-product (list 1 2 3) (list 4 5 6))

(matrix-*-vector (list (list 1 2 3) (list 4 5 6)) (list 2 1 3))

(transpose (list (list 1 2 3) (list 4 5 6)))

(matrix-*-matrix (list (list 1 2) (list 3 4)) (list (list 5 6) (list 7 8)))
