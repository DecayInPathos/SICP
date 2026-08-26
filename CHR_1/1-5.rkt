;Ben Bitdiddle方法【片；‘’‘’‘’‘’‘’‘’‘’‘’‘’‘’】】】】】】】】】【p------'】；；
#lang sicp
(define (p) (p))
(define (test x y)
        (if (= x 0) 
            0 
            y))
(test 0 (p))
;没有结果的输出，所以是先求解(p)，故而是“先求参数值而后应用”，应用序求值
