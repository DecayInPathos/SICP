#lang sicp
(define (averge x y)
        (/ (+ x y) 2))
(define (abs x)
        (if (< x 0) (- 0 x) x))
(define (sqrt-improve guess x)
        (averge (/ x guess) guess))
(define (Good-Enough? last guess x) 
        (<(abs (/ (- last guess) guess))0.00000000001))
(define (sqrt-iter last guess x)
        (if (Good-Enough? last guess x) 
            guess 
            (sqrt-iter guess (sqrt-improve guess x) x)))
(define (sqrt x) (exact->inexact (sqrt-iter 0 1 x)))
(sqrt 45)
(sqrt 0.00000003)
;有效