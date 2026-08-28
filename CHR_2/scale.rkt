#lang sicp
(define (scale_list items factor)
  (if (null? items)
      nil
      (cons (*(car items) factor)
	    (scale_list (cdr items) factor))))
(scale_list (list 0 1 2 3) 10)
