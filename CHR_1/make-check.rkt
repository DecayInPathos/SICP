#lang sicp
;人民币一共0.5，1，5，10，20，50，100
(define (dec x) (- x 1))
(define (amount-money x) 
        (cond ((= x 1) 0.5)
              ((= x 2) 1)
              ((= x 3) 5)
              ((= x 4) 10)
              ((= x 5) 20)
              ((= x 6) 50)
              ((= x 7) 100)))
(define (kind-of-making-check-iter all kind-of-money)
        (cond((= all 0) 1)
             ((< all 0) 0)
             ((= kind-of-money 0) 0)
             (else (+(kind-of-making-check-iter  all 
                                                (dec kind-of-money))
                     (kind-of-making-check-iter (- all (amount-money kind-of-money))
                                                kind-of-money)))))

(display (kind-of-making-check-iter 9 7))
