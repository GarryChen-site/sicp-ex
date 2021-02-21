#lang racket

(define (sumOfMaxNum x y) (+ x y))

(define (sumOfLargestTwo x y z)
  (cond ((and (>= (+ x y) (+ y z)) (>= (+ x y) (+ x z))) (sumOfMaxNum x y))
        ((and (>= (+ x z) (+ y z)) (>= (+ x z) (+ x y))) (sumOfMaxNum x y))
        (else (sumOfMaxNum y z))))

(sumOfLargestTwo 1 2 3)