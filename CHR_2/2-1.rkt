#lang sicp

(define (abs x)(cond((< x 0)(- 0 x))(else x)))

(define (make-rat-first x y)
  (cond((and(< x 0)(< y 0))(cons (- 0 x)(- 0 y)))
    ((< (* x y) 0)(cons (- 0 (abs x)) (abs y)))
    (else (cons x y))))

(define (make-rat x y)
  (let* ((x1 (car (make-rat-first x y)))
         (y1 (cdr (make-rat-first x y)))
         (g (gcd x1 y1)))
    (cons (/ x1 g)(/ y1 g))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (numer x)(car x));分子
(define (denom x)(cdr x));分母

(define x (make-rat 6 -3))
(print-rat x)

