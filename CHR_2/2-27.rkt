#lang sicp
(define (deep-reverse list1)
  (cond ((null? list1)nil)
    ((not(pair? (car list1))) (append  (deep-reverse(cdr list1)) (list (car list1)) ) )
    (else (append (deep-reverse(cdr list1)) (list (deep-reverse (car list1)))))))

