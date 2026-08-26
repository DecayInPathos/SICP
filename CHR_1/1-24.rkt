#lang sicp
(define (square x) (* x x))
(define (expmod base exp m)
        (cond ((= exp 0) 1)
              ((even? exp)
               (remainder(square (expmod base (/ exp 2) m))m))
              (else (* base(expmod base (- exp 1) m)))))
(define (fermat-test n)
        (define (try-it a)
                (= (expmod a n n) a))
        (try-it (+ 1 (random (- n 1)))))
(define (fast-prime? n times)
        (cond ((= times 0) #t)
              ((fermat-test n) (fast-prime? n (- times 1)))
              (else #f)))

(define (report-prime elapsed-time)
        (display"***")
        (display elapsed-time))
(define (start-prime-test n start-time)
        (if ( fast-prime? n 100)
            (report-prime (- (runtime) start-time))))
(define (timed-prime-test n)
        (newline)
        (display n)
        (start-prime-test n (runtime)))

(timed-prime-test 1000003)

        
#|
(base) pathos@deMacBook-Air sicp % racket /Users/pathos/Desktop/sicp/U1/1-24.rkt

1009***16
1013***15
1019***15
10007***19
10009***18
10037***20
1000003***64
1000033***48
1000037***50%          
|#

;基本上是符合的
;但是数字越大，执行的时间越短，可能与操作的调度有关