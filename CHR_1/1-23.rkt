#lang sicp
(define (next tmp)
        (if (= tmp 2) 3 (+ tmp 2)))
(define (find-divisor-iter n tmp start-time)
        (cond( (< n (* tmp tmp)) (begin (display n)(display "***")  (display(-( runtime) start-time))))
             ( (= (remainder n tmp)0) (begin (display tmp)(display "***")  (display(-( runtime) start-time))))
             (else (find-divisor-iter n (next tmp) start-time))))
(define (find-divisor n)(find-divisor-iter n 2 (runtime)))


(find-divisor 1000033)
(newline)

(define (find-divisor-iter1 n tmp start-time)
        (cond( (< n (* tmp tmp)) (begin (display n)(display "***")  (display(-( runtime) start-time))))
             ( (= (remainder n tmp)0) (begin (display tmp)(display "***")  (display(-( runtime) start-time))))
             (else (find-divisor-iter1 n (+ tmp 1) start-time))))
(define (find-divisor1 n)(find-divisor-iter1 n 2 (runtime)))



(find-divisor1 1000033)
(newline)

;用大数字测试：跳过偶数的版本应该快约2倍
;用较小的数字则不明显
;还有next过程的时间，时间精度可能不足，系统等问题

#|
1000033***8
1000033***20
|#