#lang racket

;; 0. Factorial
(define (facthelper num acc)
  (if (> 1 num)
    acc
    (facthelper (- num 1) (* acc num))
    )
  )

(define (factorial num)
  (facthelper (- num 1) num)
  )

(factorial 3)
(newline)

;; 1. Filter
(define (my-filter-tail check lst acc)
  (cond ((null? lst) (reverse acc))
        ((check (first lst)) (my-filter-tail check (rest lst) (cons (first lst) acc) ))
        (else (my-filter-tail check (rest lst) acc))
        )
  )

(define (my-filter func lst)
  (my-filter-tail func lst empty)
  )

(display '(filter) ) (newline)
(my-filter number? '(1 2 'NOPE 3))

;; 2. Map
(define (my-map-tail func lst acc)
    (if (null? lst)
      ;;(cons acc empty)
      acc
      (my-map-tail func (rest lst) (cons (func (first lst)) acc))
    )
  )

(define (my-map func lst)
    (my-map-tail func (reverse lst) empty)
  )


(display '(map) ) (newline)
(my-map (lambda (x) (+ 1 x)) '(1 2 3 4))

;; 3. Append
(define (my-append-tail lst  acc)
    (if (null? lst)
      acc
      (my-append-tail (rest lst) (cons (first lst) acc))
      )
  )

(define (my-append lst1 lst2)
    (my-append-tail (reverse lst1) lst2)
  )


(display '(append) ) (newline)
(my-append '(1 2 3) '(4 5 6))

;; 4. Zip
(define (flatzip-tail lst1 lst2 acc)
    (cond ((null? lst1) acc)
          ((null? lst2) acc)
          ;;(else (flatzip-tail (rest lst1) (rest lst2) 0))
          (else (flatzip-tail (rest lst1) (rest lst2) (my-append acc (cons (cons (first lst1) (first lst2)) empty))))
          )
  )

(define (flatzip lst1 lst2)
    (flatzip-tail lst1 lst2 empty)
  )

(display '(flatzip) )(newline)
(flatzip '(1 2 3 4 5) '(a b c d))

;; 5. Reverse
(define (my-reverse-tail lst acc)
  (if (null? lst)
    acc
    (my-reverse-tail (rest lst) (cons (first lst) acc))
    )
  )

(define (my-reverse lst)
    (my-reverse-tail lst empty)
  )

(display '(reverse) ) (newline)
(my-reverse '(1 2 3 4 5))


;; 6. More PUZZLES
