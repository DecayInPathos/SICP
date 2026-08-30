#lang sicp
(define (deep-reverse list1)
  (cond ((null? list1)nil)
    ((not(pair? (car list1))) (append (cdr list1) (list (car list1)) ) )
    (else (append (cdr list1) (list (deep-reverse (car list1)))))))

;; 测试1：你原来能跑对的样例（巧合正确）
(define a (list(list 1 2)(list 3 4 ) ))
(display "测试1 a = ((1 2) (3 4))：")
(display (deep-reverse a))
(newline)

;; 测试2 反例1：扁平列表，直接出错
(define b '(1 2 3 4))
(display "测试2 b = (1 2 3 4)，预期(4 3 2 1)，实际：")
(display (deep-reverse b))
(newline)

;; 测试3 反例2：三层嵌套，也会出错
(define c '( (1 2) 3 (4 5 6) 7 ))
(display "测试3 c = ((1 2) 3 (4 5 6) 7)：")
(display (deep-reverse c))
(newline)
