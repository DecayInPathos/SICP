;正整数的乘法
;根本跑不出来
#lang sicp
(define (Max a b) (if (or (= a b)(> a b)) a b))
(define (Min a b) (if (or (= a b)(< a b)) a b))
(define (*-iter a b)
        (cond((= b 0)  0)
             ((= b 1)  a)
             ((= (remainder b 2)0) (*-iter (+ a a) (/ b 2)))
             (else (+ (*-iter (* a   (- b 1)))a))))
(define (* a b)
        (*-iter (Max a b) (Min a b)))

(* 3 2)

