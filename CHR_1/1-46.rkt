#lang sicp

(define (iterative-improve good-enough? improve)
  (lambda (first-guess)
    (define (try guess)
      (let ((next (improve guess)))
        (if (good-enough? guess next)
            next
            (try next))))
    (try first-guess)))

(define tolerance 0.00001)

(define (sqrt x)
  ((iterative-improve
    (lambda (guess next) (< (abs (- (square next) x)) tolerance))
    (lambda (guess) (/ (+ guess (/ x guess)) 2)))
   1.0))

(define (square x) (* x x))

(define (fixed-point f first-guess)
  ((iterative-improve
    (lambda (v1 v2) (< (abs (- v1 v2)) tolerance))
    f)
   first-guess))

; 测试
(sqrt 9)   ; 应该接近3
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)  ; 黄金分割比
