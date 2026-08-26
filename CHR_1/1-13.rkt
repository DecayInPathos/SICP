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


(define (fib n)
        (fib-iter 1 1 n))
(define (fib-iter a b count)
        (if (= count 1) 
            a
            (fib-iter b (+ a b) (- count 1))))


(define (^n-iter n x amount)
        (cond ((= n 0) amount)
              (else (^n-iter (- n 1)
                             x
                             (* amount x)))))    
(define (^n n x) (^n-iter n x 1))    

(^n 2 4)

(define sqrt5 (sqrt 5))
(define (proof n)
        (-(* sqrt5 (fib   n))
          (- (^n n (/ (+ 1 sqrt5 )2))
             (^n n (/ (- 1 sqrt5 )2)))))

(proof 12)
