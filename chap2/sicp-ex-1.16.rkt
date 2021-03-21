#lang racket

(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (expt1 b n)
  (expt-iter b n 1))

(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter b (- counter 1) (* b product)
                 )))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (fast-expt b n)
  (cond ((= n 0)
         1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))
(define (even? n)
  (= (remainder n 2) 0))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (fast-expt-iter b n)
  (iter n b 1))

(define (iter n b a)
  (conf ((= n 0) a)
        ((even? n) (iter (/ n 2) (square b) a))
        (else (iter (- n 1) b (* b a)))))