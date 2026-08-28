#lang sicp
(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
	    (map proc (cdr items)))))
(define (square-list items)
  (if (null? items)
      nil
      (cons (* (car items) (car items))
	    (square (cdr items)))))
(define (square-list items)
  map (lambda (a) (* a a)) items)
