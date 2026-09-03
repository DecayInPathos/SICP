#lang sicp
(define (all-triples  seq)
        (cond ((null? seq)nil)
        (else(let ((a (car(car seq)))
	      (b (car(cdr(car seq))))
	      (c (car(cdr(cdr(car seq))))))
	     (if (null? seq)
	         nil
		 (append (list(list a b c)
	                      (list a c b)
			      (list b a c)
			      (list b c a)
			      (list c a b)
			      (list c b a))
	                 (all-triples (cdr seq))))))))
(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (enumerate-interval low high)
        (if (> low high)
	    nil
	    (cons low (enumerate-interval (+ low 1) high))))
(define (unique-pairs n)
        (accumulate append
		    nil
		    (map (lambda (i)
	                         (map (lambda (j) (list i j))
				      (enumerate-interval 1 (-  i 1))))
				 (enumerate-interval 1 n))))
(define (unique-triples n)
        (cond ((< n 3)(error "参数n应该最小是3"))
	      (else(accumulate append
		         nil
			 (map (lambda (i) 
	                              (map (lambda (j) (append (list i) j ))
				           (unique-pairs (- i 1))))
				      (enumerate-interval 3 n))))))
(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else
         (filter predicate (cdr sequence)))))
(define (triples-N-S n s)
        (all-triples(filter (lambda (a)(= (+ (car a) (car(cdr a)) (car(cdr(cdr a))))  s))
			    (unique-triples n))))
(triples-N-S 5 6)


