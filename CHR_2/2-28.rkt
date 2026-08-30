#lang sicp
(define (fringe lst)
  (cond ((null? lst) '())
        ((not (pair? (car lst)))
         (append (list (car lst))
                 (fringe (cdr lst))))
        (else
         (append (fringe (car lst))
                 (fringe (cdr lst))))))

(define a (list (list 1 2) (list 3 4)))
(fringe a)