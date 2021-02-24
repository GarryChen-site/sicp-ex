#lang racket

;cube root improve 
(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (square guess)
  (* guess guess))

(define (good-enough? guess x)
  (= (improve guess x ) guess))

(define (3rt-iter guess x)
  (if (good-enough? guess x)
      guess
      (3rt-iter (improve guess x) x)))

(define (3root x)
  (3rt-iter 1.1 x))

(3root 8)