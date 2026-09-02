#lang sicp
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))
(define (accumulate op initial sequence)
        (cond((null? sequence)initial)
	      (else (op (car sequence)
		        (accumulate op initial (cdr sequence))))))
(define (first-cons seqs)
        (if (null? seqs)
	    nil
	    (cons (car (car seqs)) (first-cons (cdr seqs)))))
(define (second-cons seqs)
        (if (null? seqs)
	    nil
	    (cons (cdr(car seqs)) (second-cons (cdr seqs)))))
(define (accumulate-n op init seqs)
        (if (null? (car seqs))
	    nil
	    (cons (accumulate op init (first-cons seqs))
	          (accumulate-n op init (second-cons seqs)))))
(accumulate-n + 0 (list (list 1 2 3)(list 4 5 6)(list 7 8 9)(list 10 11 12)))

