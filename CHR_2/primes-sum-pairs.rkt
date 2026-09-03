#lang sicp
(define (accumulate op initial sequence)
        (cond((null? sequence)initial)
	      (else (op (car sequence)
		        (accumulate op initial (cdr sequence))))))
(define (enumerate-interval low high)
        (if (> low high)
	    nil
	    (cons low (enumerate-interval (+ low 1) high))))
(define (enumerate-cons n)
        (accumulate append
		    nil
		    (map (lambda (i)
	                         (map (lambda (j) (list i j))
				      (enumerate-interval 1 (-  i 1))))
				 (enumerate-interval 1 n))))
(define (mapflat proc seq)
        (append append nil (map proc seq)))

(define (primes-sum? pair)
        (primes? (+ (car pair) (car (cdr pair)))))

(define (make-pair-sum pair)
        (list (car list)
	      (car (cdr pair))
	      (+ (car list) (car (cdr list)))))


(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (flatmap
                (lambda (i)
                  (map (lambda (j) (list i j))
                       (enumerate-interval 1 (- i 1))))
                (enumerate-interval 1 n)))))

