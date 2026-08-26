#lang sicp
(define (Max a b) (if (or (= a b)(> a b)) a b))
(define (Min a b) (if (or (= a b)(< a b)) a b))
(define (*-iter a b c)
        (cond((= b 0)  c)
             ((= (remainder b 2)0) (*-iter (+ a a) (/ b 2) c))
             (else (*-iter  a (- b 1) (+ c a)))))
(define (* a b)
        (*-iter (Max a b) (Min a b) 0))

(* 2 100)