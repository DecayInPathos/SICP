#lang sicp
(define (make-interval a b)(cons a b))
(define (upper-bound x) (cdr x))
(define (lower-bound x) (car x))

(define (add-interval x y)
  (make-interval(+ (lower-bound x)(lower-bound y))
                (+ (upper-bound x)(upper-bound y))))
(define (sub-interval x y)
  (make-interval (- (upper-bound x) (lower-bound y))
                 (- (lower-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (if (and (<= (lower-bound y) 0)
           (>= (upper-bound y) 0))
      (error "Division by an interval that spans zero")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))
(define (make-center-percent center percent)
  (make-interval (* center (- 1 percent))(* center (+ 1 percent))))
(define (center x)(/ (+ (upper-bound x)(lower-bound x)) 2.0))
(define (percent x)(/ (/ (- (upper-bound x)(lower-bound x)) 2.0) (/ (+ (upper-bound x)(lower-bound x)) 2.0)))

(define R1 (make-center-percent 3.0 0.00010))
(define R2 (make-center-percent 4.0 0.00100))

(center (par1 R1 R2))
(center (par2 R1 R2))
(percent (par1 R1 R2))
(percent (par2 R1 R2))

