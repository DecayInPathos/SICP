#lang sicp
(define(product term a next b)
       (if (> a b)
           1
           (* (term a) (product term (next a) next b))))
(define (term a)(/(* (+ a 1)(- a 1))(* a a)))
(define (next a)(+ a 2))
(* 4.0(product term 3 next 10000))

(define (product1 term a next b)
        (define (iter a result)
                (if (> a b)
                    result
                    (iter (next a) (* result (term a)))))
        (iter a 1))
(* 4.0 (product1 term 3 next 10000))
