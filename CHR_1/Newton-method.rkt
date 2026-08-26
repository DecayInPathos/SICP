#lang sicp
(define (averge x y)
        (/ (+ x y) 2))
(define (abs x)
        (if (< x 0) (- 0 x) x))
(define (sqrt x)
    (define (sqrt-improve guess x)
            (averge (/ x guess) guess))
    (define (Good-Enough? guess x) 
            (< (abs (-(* guess guess) x)) 0.000000001))
    (define (sqrt-iter guess x)
            (if (Good-Enough? guess x) 
                guess 
                (sqrt-iter (sqrt-improve guess x) x)))
    (exact->inexact (sqrt-iter 1 x)))
(sqrt 45)
 