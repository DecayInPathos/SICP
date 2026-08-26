#lang sicp

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x) (/ (+ x (f x)) 2)))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 0)
      identity
      (compose f (repeated f (- n 1)))))

(define (identity x) x)

(define (nth-root n x)
  (fixed-point 
   ((repeated average-damp (floor (/ (log n) (log 2))))
    (lambda (y) (/ x (expt y (- n 1)))))
   1.0))

; 测试
(nth-root 2 4)   ; 应该接近2
(nth-root 3 8)   ; 应该接近2
(nth-root 4 16)  ; 应该接近2
