#lang sicp
(define (a-plus-abs-b a b)
        ((if (> b 0) + -) a b))
(a-plus-abs-b 1 -2)
;a加上“b的绝对值”
  
