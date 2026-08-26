#lang sicp
(define(accmulate1 combiner null-value term a next b)
       (if (> a b)
           null-value
           (combiner (term a) (product term (next a) next b))))

(define (sum term a next b))(accmulate1 + 0 term a next b)
(define (product term a next b))(accmulate1 * 1 term a next b)

(define (accmulate2 combiner null-value term a next b)
        (define (iter a result)
                (if (> a b)
                    result
                    (iter (next a) (combiner result (term a)))))
        (iter a null-value))

(define (sum term a next b))(accmulate2 + 0 term a next b)
(define (product term a next b))(accmulate2  * 1 term a next b)