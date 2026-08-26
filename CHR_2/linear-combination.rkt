#lang sicp

(define (linear-combination a b x y)
  (+(* a x)(* b y)))

(define (linear-combination-normal a b x y)
  (add (mul a x)(mul  b y)))

(display  (linear-combination 1 1 1 1))
