#lang racket

;(define (sqrt-iter guess x)
  ;(if (good-enough? guess x)
     ; guess
      ;(sqrt-iter (improve guess x)
                ; x)))
; The default if statement is a special form which means that even when an interpreter follows
; applicative substitution, it only evaluates one of its paramenters - not both.However,the newly created
; new-if doesn't have this property and hence, it never stops calling itself due to the third parameter passed
; to it in sqrt-iter
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x) (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)