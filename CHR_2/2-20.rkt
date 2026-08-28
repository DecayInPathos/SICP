#lang sicp

(define (same-parity-iter first  w)
  (if (null? w)
      nil
      (if (= (remainder first 2) 0)
          (if (= (remainder (car w) 2) 0)
              (cons (car w)
                    (same-parity-iter first (cdr w)))
              (same-parity-iter first (cdr w)))
          (if (= (remainder (car w) 2) 1)
              (cons (car w)
                    (same-parity-iter first (cdr w)))
              (same-parity-iter first (cdr w))))))

(define (same-parity . w)(same-parity-iter (car w) w))


(same-parity  10 2 3 4 5 6)