#lang sicp


(define (make-interval a b)(cons a b))
(define (upper-bound x) (cdr x))
(define (lower-bound x) (car x))
;; 区间是否完全为正
(define (positive? i)
  (> (lower-bound i) 0))

;; 区间是否完全为负
(define (negative? i)
  (< (upper-bound i) 0))

;; 区间是否跨零
(define (spans-zero? i)
  (and (<= (lower-bound i) 0)
       (>= (upper-bound i) 0)))

(define (mul-interval x y)
  (let ((lx (lower-bound x))
        (ux (upper-bound x))
        (ly (lower-bound y))
        (uy (upper-bound y)))
    (cond
      ;; 1) x > 0, y > 0
      ((and (positive? x) (positive? y))
       (make-interval (* lx ly) (* ux uy)))

      ;; 2) x > 0, y < 0
      ((and (positive? x) (negative? y))
       (make-interval (* ux ly) (* lx uy)))

      ;; 3) x > 0, y spans zero
      ((and (positive? x) (spans-zero? y))
       (make-interval (* ux ly) (* ux uy)))

      ;; 4) x < 0, y > 0
      ((and (negative? x) (positive? y))
       (make-interval (* lx uy) (* ux ly)))

      ;; 5) x < 0, y < 0
      ((and (negative? x) (negative? y))
       (make-interval (* ux uy) (* lx ly)))

      ;; 6) x < 0, y spans zero
      ((and (negative? x) (spans-zero? y))
       (make-interval (* lx uy) (* lx ly)))

      ;; 7) x spans zero, y > 0
      ((and (spans-zero? x) (positive? y))
       (make-interval (* lx uy) (* ux uy)))

      ;; 8) x spans zero, y < 0
      ((and (spans-zero? x) (negative? y))
       (make-interval (* ux ly) (* lx ly)))

      ;; 9) x spans zero, y spans zero
      ((and (spans-zero? x) (spans-zero? y))
       (make-interval (min (* lx uy) (* ux ly))
                      (max (* lx ly) (* ux uy)))))))