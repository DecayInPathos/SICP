#lang sicp
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))
(define (cons a b)
  (lambda (m)(m a b)));
(define (car z)
  (z (lambda (a b)(expt 2 a))))
(define (cdr z)
  (z (lambda (a b)(expt 3 b))))
