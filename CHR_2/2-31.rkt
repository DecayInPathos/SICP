#lang sicp
(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
	    (map proc (cdr items)))))

(define (map-tree proc items)
  (define (proc0 sub)(cond ((null? sub) nil)
		      ((pair? sub) (map-tree proc sub))
		      (else (proc sub))))
  (map proc0 items))
