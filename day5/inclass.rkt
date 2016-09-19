#lang racket

(define (list-length lst)
  ;;(foldl + 0 (map (lambda (n) 1) lst))
  (foldl (lambda (x y) (+ y 1)) 0 lst) ;; acc is second
  )

(list-length '(1 2 3 4))

(define (count-evens lst)
  (list-length (filter even? lst))
  )

;;(count-evens '(1 2 3))

(define (list-square xs)
  (map (lambda (x) (* x x)) xs)
  )

;;(list-square '(1 2 3))

(define (list-add1 xs)
  (map (lambda (x) (+ 1 x)) xs)
  )

;;(list-add1 '(1 2 3))

(define (list-add10 xs)
  (map (lambda (x) (+ 10 x)) xs)
  )

;;(list-add10 '(1 2 3))

(define (list-addn xs n)
  (map (lambda (x) (+ n x)) xs)
  )

;;(list-addn '(1 2 3) 4)

(define (filter-even xs)
  (filter even? xs)
  )

;;(filter-even '(1 2 3 4))


(define (filter-positive xs)
  (filter (lambda (x) ( if ( > x 0 ) #t #f)) xs)
  )

;;(filter-positive '(-1 2 -5 3))

(define (filter-gt xs lower)
  (filter (lambda (x) ( if ( >= x lower ) #t #f)) xs)
  )

;;(filter-gt '(1 2 3 4 5) 3)


