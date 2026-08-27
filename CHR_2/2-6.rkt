#lang sicp
(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)(lambda (f) (lambda(x)(f ((n f)x)))))
(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x)(f(f x)))))
;when it equal to 0, x
;when it equal to 1, (f((x f)x)),x -> (x f) -> ((x f)x) -> x -> (f x)
;when it equal to 2, (f x) -> (f(f x))
(define (add a b)(lambda(f)(lambda (x) ((a f)((b f)x)))))
