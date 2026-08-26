#lang sicp
(define (averge x y)
        (/ (+ x y) 2))
(define (abs x)
        (if (< x 0) (- 0 x) x))
(define (cube-improve guess x)
        (/ (+ (/ x (* guess guess))(* 2 guess))
           3))
(define (Good-Enough? guess x) 
        (< (abs (-(* guess guess guess) x)) 0.000000001))
(define (cube-iter guess x)
        (if (Good-Enough? guess x) 
            guess 
            (cube-iter (cube-improve guess x) x)))
(define (cube x) (exact->inexact (cube-iter 1 x)))
(cube 45)
 