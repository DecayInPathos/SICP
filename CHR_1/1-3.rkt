#lang sicp
(define (MAX x y z)
        (cond ((> x y)(if (> x z) x z))
            (else (if (> y z) y z))))
(MAX 1 2 3)
(MAX -1 0 1)
