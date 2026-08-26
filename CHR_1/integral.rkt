#lang sicp
(define (cube a) (* a a a))
(define (sum term a next b)
        (if (> a b)
            0
            (+ (term a)
               (sum term (next a) next b))))
(define (integral f a b dx)
        (define (add-dx x) (+ x dx))
        (* (sum f 
                (+ a (/ dx 2.0))
                add-dx
                b)
           dx))
    
(integral cube 0 1 0.01)
(integral cube 0 1 0.001)

#|
(base) pathos@deMacBook-Air sicp % racket /Users/pathos/Desktop/sicp/U1/integral.rkt
0.24998750000000042
0.249999875000001
|#
