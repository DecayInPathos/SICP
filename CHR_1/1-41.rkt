#lang sicp
(define (double a) (lambda (x) (a (a x))))
(((double (double double))inc)5)
