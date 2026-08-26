#lang sicp
(define (fib n)
        (fib-iter 1 1 n))
(define (fib-iter a b count)
        (if (= count 1) 
            a
            (fib-iter b (+ a b) (- count 1))))

(fib 1)
(fib 2)
(fib 3)
(fib 4)
(fib 5)
(fib 6)