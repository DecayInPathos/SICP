#lang sicp

(define (make-interval a b)(cons a b))
(define (upper-bound x) (cdr x))
(define (lower-bound x) (car x))

(define (make-center-percent center percent)
  (make-interval (* center (- 1 percent))(* center (+ 1 percent))))
(define (center x)(/ (+ (upper-bound x)(lower-bound x)) 2.0))
(define (percent x)(/ (/ (- (upper-bound x)(lower-bound x)) 2.0) (/ (+ (upper-bound x)(lower-bound x)) 2.0)))
