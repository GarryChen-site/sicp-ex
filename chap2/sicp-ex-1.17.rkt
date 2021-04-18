#lang racket

(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (* a b)
  (cond ((= b 0) 0)
        ((even? b) (double (* a (halve b))))
        (else (+ a (* a (- b 1))))))

 ; (fast-mult 3 7) 
 ; (+ 3 (fast-mult 3 6)) 
 ; (+ 3 (double (fast-mult 3 3)) 
 ; (+ 3 (double (+ 3 (fast-mult 3 2)))) 
 ; (+ 3 (double (+ 3 (double (fast-mult 3 1))))) 
 ; (+ 3 (double (+ 3 (double (+ 3 (fast-mult 3 0)))))) 
 ; (+ 3 (double (+ 3 (double (+ 3 0))))) 
 ; (+ 3 (double (+ 3 (double 3)))) 
 ; (+ 3 (double (+ 3 6))) 
 ; (+ 3 (double 9)) 
 ; (+ 3 18) 
 ; 21 
