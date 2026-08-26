#lang sicp
(define (make-point x y)(cons x y))
(define (x-point x)(car x))
(define (y-point x)(cdr x))
(define (make-segment x y)(cons x y))
(define (start-segment x)(car x))
(define (end-segment x)(cdr x))

(define (midpoint x)
  (let* ((start-point (start-segment x))
         (end-point (end-segment x))
         (start-point-x (x-point start-point))
         (start-point-y (y-point start-point))
         (end-point-x (x-point end-point))
         (end-point-y (y-point end-point)))
        (make-point((/(+ start-point-x end-point-x)2)
                    (/(+ start-point-y end-point-y)2)))))


