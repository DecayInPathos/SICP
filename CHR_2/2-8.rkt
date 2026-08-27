#lang sicp
(define (make-interval a b)(cons a b))
(define (upper-bound x) (cdr x))
(define (lower-bound x) (car x))
(define (sub-interval x y)
  (make-interval(- (upper-bound x)(lower-bound y))
                (- (lower-bound x)(upper-bound y))))
