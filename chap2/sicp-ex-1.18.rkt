#lang racket

(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (* a b)
  (iter a b 0))

(define (iter a b accumulator)
  (cond ((= b 0) accumulator)
        ((even? b (iter (double a) (halve b) accumulator)))
        (else (iter (+ accumulator a) a (- b 1)))))
  