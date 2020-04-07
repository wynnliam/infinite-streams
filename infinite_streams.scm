; Liam Wynn, 4/6/2020, Structure and Interpretation of Computer Programs

; Example infinite streams

(define (integers-starting-from n)
  (cons-stream n (integers-starting-from (+ n 1))))

(define integers (integers-starting-from 1))

(define (divisible? x y) (= (remainder x y) 0))

(define no-sevens
  (stream-filter (lambda (x) (not (divisible? x 7)))
                 integers))

(define (fibgen a b)
  (cons-stream a (fibgen b (+ a b))))

(define fibs (fibgen 0 1))

(define (sieve stream)
  (cons-stream
    (stream-car stream)
    (sieve (stream-filter
             (lambda (x)
               (not (divisible? x (stream-car stream))))
             (stream-cdr stream)))))

; We start with the integers beginning with 2.
; We then remove all multiples of 2 from the rest
; of the integers. This leaves a stream starting with
; 3. We then remove all multiples of 3. So the next
; one is 5. We basically construct all primes via a sieve
; method.
(define primes (sieve (integers-starting-from 2)))
