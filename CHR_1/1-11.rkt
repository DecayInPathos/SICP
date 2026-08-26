#lang sicp
(define (find<3 n)
        (cond ((< n 3) n)
              ((or (= n 3) (> n 3))
               (find<3 (- n 1)))))
(define (f-iter a b c n)
        (cond ((< n 3) c)
              ((or (= n 3) (> n 3))
               (f-iter b c (+ c (* 2 b) (* 3 a)) (- n 1)))))
(define (f n) (f-iter (- (find<3 n) 2) 
                      (- (find<3 n) 1) 
                      (find<3 n) 
                      n))
(f 3)
(f 4)
(f 5)
(f 6)
#|
(base) pathos@deMacBook-Air sicp % racket /Users/pathos/Desktop/sicp/U1/1-11.rkt
4
11
25
59
|#