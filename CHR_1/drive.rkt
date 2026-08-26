#lang sicp
(define dx 0.000001)
(define (drive g)
        (lambda (x) (/(- (g (+ x dx)) (g x))dx)))
(define (cube x)(* x x x))
(define (newton-transform g)
        (lambda (x) (- x (/ (g x) ((drive g) x)))))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
        (define (close-enough? v1 v2)
                (< (abs (- v1 v2))tolerance))
        (define (try guess)
                (let ((next (f guess)))
                     (if (close-enough? guess next)
                                next
                        (try next))))
        (try first-guess))

(define (newton-method g guess)
        (fixed-point (newton-transform g) guess))

(define (sqrt x)
        (newton-method (lambda (y) (- (* y y) x)) 1.0))

(sqrt 16)
