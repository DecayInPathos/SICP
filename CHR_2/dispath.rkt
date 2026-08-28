#lang sicp
(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (error "Argument not 1 or 0"m))))
  dispatch)

(define (car z)(z 0))
(define (cdr z)(z 1))