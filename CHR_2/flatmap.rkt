#lang sicp
(define (mapflat proc seq)
        (append append nil (map proc seq)))
