#lang sicp
(define (smallesr-divisor-iter n a)
        (cond ((> (* a a) n)n)
              ((= (remainder n a) 0) a)
              (else (smallesr-divisor-iter n (+ a 1)))))
(define (smallesr-divisor n)(smallesr-divisor-iter n 2))
(smallesr-divisor 17)
(smallesr-divisor 81)
