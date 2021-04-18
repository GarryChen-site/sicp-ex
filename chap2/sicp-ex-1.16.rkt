#lang racket

(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 线性迭代版
(define (expt1 b n)
  (expt-iter b n 1))

(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter b (- counter 1) (* b product))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 递归版
(define (fast-expt b n)
  (cond ((= n 0)
         1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 题目的提示，计算过程结束时用a的值作为回答。
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 所以，n在变化，但a和b^n的乘积不变，定义一个常量，要求它在状态之间保持不变
(define (fast-expt-iter b n)
  (iter n b 1))
;;; (iter n b a) = b^n * a
;;; 所以从a从1开始，以n不断减小，a不断累加，最终返回a的值
(define (iter n b a)
  (conf ((= n 0) a)
        ((even? n) (iter (/ n 2) (square b) a))
        (else (iter (- n 1) b (* b a)))))