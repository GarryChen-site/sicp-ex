#lang racket

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

;;; application-order evaluate the arguments and then apply
;;; (test 0 (p))
;;; (test 0 (p))
;;; (test 0 (p))
;;; and so on

;;; normal-order  fully expand and then reduce
;;; (test 0 (p))
;;; (if (= 0 0) 0 (p))
;;; (if #t 0 (p))
;;; 0