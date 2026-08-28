#lang sicp

(define (make-interval a b)(cons a b))
(define (upper-bound x) (cdr x))
(define (lower-bound x) (car x))

(define (make-center-percent center percent)
  (make-interval (* center (- 1 percent))(* center (+ 1 percent))))
(define (center x)(/ (+ (upper-bound x)(lower-bound x)) 2.0))
(define (percent x)(/ (/ (- (upper-bound x)(lower-bound x)) 2.0) (/ (+ (upper-bound x)(lower-bound x)) 2.0)))

;[center_1(1-percent_1),center_1(1+percent_1)]\\
;[center_1(1-percent_1),center_2(1+percent_2]\\
;Lower=center_1(1-percent_1)*center_1(1-percent_1)\\
;=center_1*center_2(1-percent_1percent_2-percent_1-percent_2)\\
;percent_1percent_2\approx 0\\
;故而答案是percent_1+percent_2
