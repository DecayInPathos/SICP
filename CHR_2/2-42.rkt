; SICP 2.2.3 八皇后完整基础工具
(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (filter predicate sequence)
  (cond ((null? sequence) '())
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define empty-board '())

; 正确 adjoin‑position：把新皇后 (new‑row,k) 加到棋盘头部
(define (adjoin-position new-row k rest-of-queens)
  (cons (cons new-row k) rest-of-queens))

; 判断两个皇后是否互相攻击
(define (queen-attack? a b)
  (let ((dr (abs (- (car a) (car b))))
        (dc (abs (- (cdr a) (cdr b)))))
    (or (= (car a) (car b))    ;同行
        (= (cdr a) (cdr b))    ;同列
        (= dr dc))))           ;对角线

; safe?：positions是棋盘，第一个元素是刚刚新增的第k列皇后
(define (safe? k positions)
  (let ((new-q (car positions)))
    (define (iter others)
      (if (null? others)
          #t
          (and (not (queen-attack? new-q (car others)))
               (iter (cdr others)))))
    (iter (cdr positions))))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

; 测试 (queens 4)


