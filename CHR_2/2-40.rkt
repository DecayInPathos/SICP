#lang sicp
(define (accumulate op initial sequence)
        (cond((null? sequence)initial)
	      (else (op (car sequence)
		        (accumulate op initial (cdr sequence))))))
(define (enumerate-interval low high)
        (if (> low high)
	    nil
	    (cons low (enumerate-interval (+ low 1) high))))

(define (square x) (* x x))
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test)
  (cond ((> (square test) n) n)
        ((= (remainder n test) 0) test)
        (else (find-divisor n (+ test 1)))))
(define (prime? n)
  (= n (smallest-divisor n)))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (unique-pairs n)
        (accumulate append
		    nil
		    (map (lambda (i)
	                         (map (lambda (j) (list i j))
				      (enumerate-interval 1 (-  i 1))))
				 (enumerate-interval 1 n))))
(define (mapflat proc seq)
        (accumulate append nil (map proc seq)))

(define (primes-sum? pair)
        (prime? (+ (car pair) (car (cdr pair)))))

(define (make-pair-sum pair)
        (list (car pair)
	      (car (cdr pair))
	      (+ (car pair) (car (cdr pair)))))


(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter primes-sum? (unique-pairs n))))

