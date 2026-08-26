#lang sicp
(define (new-if a b c)(cond(a b)(else c)))


(define (averge x y)
        (/ (+ x y) 2))
(define (abs x)
        (if (< x 0) (- 0 x) x))
(define (sqrt-improve guess x)
        (averge (/ x guess) guess))
(define (Good-Enough? guess x) 
        (< (abs (-(* guess guess) x)) 0.000000001))
(define (sqrt-iter guess x)
        (new-if (Good-Enough? guess x) 
            guess 
            (sqrt-iter (sqrt-improve guess x) x)))
(define (sqrt x) (exact->inexact (sqrt-iter 1 x)))
(sqrt 45)
 
 ;表现为没有输出
 ;原因？
 ;你的代码没有输出的根本原因是：自定义的 new-if 
 ; 是普通函数，而 Scheme 遵循「应用序求值（Applicative Order）」
 ;—— 调用函数时，会先计算所有参数，再执行函数体；而原生 if 
 ;是特殊形式（Special Form），只计算「条件成立的分支」，不会计算另一个分支。)
