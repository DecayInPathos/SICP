#lang sicp
(define (even-fibs n)
  (define (next k)
    (if (> k n)
	nil
	(let ((f (fib k)))
             (if (evens f)
		 (cons f (next (+ k 1)))
		 (next (+ k 1))))))
  (next 0))
