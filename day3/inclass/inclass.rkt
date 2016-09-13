#lang racket

;; Problem 1
(define (tree-add1 tree)
  (cond ((null? tree) tree)
        ((number? (first tree)) (cons (+ (first tree) 1) (tree-add1(rest tree)) ))
        (else (cons (tree-add1 (first tree)) (tree-add1 (rest tree))))
        )
  )

(display (tree-add1 '(1 (2 3 4)))) (newline) 
(display (tree-add1 '(1 (2 (3 4)) 3 (4 5 6)))) (newline) 
(display (tree-add1 '((1 3) (2 (3 4)) 3 (4 5 6)))) (newline) 

(newline)

;; Problem 2
(define (tree-max-depth tree)
  (cond ((null? tree) 1)
        ((list? (first tree)) (max (+ 1 (tree-max-depth (first tree))) (tree-max-depth (rest tree)) ))
        (else (tree-max-depth (rest tree)))
        )
  )

(display '(Tree max depth))
(display (tree-max-depth '(1 2 3))) (newline)
(display (tree-max-depth '(1 (2 (3 1))))) (newline)
(display (tree-max-depth '((3 (4)) (2 (3 1))))) (newline)
(display (tree-max-depth '((((3 1) 4) 1) 5))) (newline)
(display (tree-max-depth '(3 (1 (4 (1 5)))) ) ) (newline)
(display (tree-max-depth '(3 (1 (4 1)) (5 (9 2))))) (newline) ;; -> 3

(newline)

;; Problem 3
(define (tree-max-width tree)
  (cond ((null? tree) 0)
        (else (+ 1 (tree-max-width (rest tree))))
    )
  )

(display (tree-max-width '(3 (1 (4 1))))) (newline) ;; -> 2
(display (tree-max-width '(3 1 (4 1)))) (newline) ;; -> 3
(display (tree-max-width '(3 (1 4 1)))) (newline) ;; -> 2

(newline)

;; Problem 4
(define (tree-count-leaves tree)
  (cond ((null? tree) 0)
        ((list? (first tree)) (+ (tree-count-leaves (first tree)) (tree-count-leaves (rest tree)) ))
        (else (+ 1 (tree-count-leaves (rest tree))))
        )
  )

(display (tree-count-leaves '(3 (1 (4 1))))) (newline) ;; -> 4
(display (tree-count-leaves '(1 2 3))) (newline) ;; 3
(display (tree-count-leaves '(1 (2 (3 1))))) (newline) ;; 4
(display (tree-count-leaves '((3 (4)) (2 (3 1))))) (newline) ;; 5
(display (tree-count-leaves '((((3 1) 4) 1) 5))) (newline) ;; 5
(display (tree-count-leaves '(3 (1 (4 (1 5)))) ) ) (newline) ;; 5
(display (tree-count-leaves '(3 (1 (4 1)) (5 (9 2))))) (newline) ;; 7

(newline)

;; Problem 5
(define (tree-map func tree)
  (cond ((null? tree) tree)
        ((list? (first tree)) (cons (tree-map func (first tree)) (tree-map func (rest tree)) ))
        (else (cons (func (first tree)) (tree-map func (rest tree)) ))
        )
  )

(display (tree-map (lambda (x) (+ 1 x)) '(3 (1 (4 1))))) (newline) ;;  
(display (tree-map (lambda (x) (+ 1 x)) '((3 4) (1 (4 1))))) (newline) ;;  

(newline)

;; Problem 6
(define (tree-max tree)
  (cond ((null? (rest tree)) 
         (cond ((list? (first tree)) (tree-max (first tree)))
               (else (first tree))
           ))
        ((list? (first tree)) (max (tree-max (first tree)) (tree-max (rest tree)) ))
        (else (max (first tree) (tree-max (rest tree))))
        )
  )

(define (tree-min tree)
  (cond ((null? (rest tree)) 
         (cond ((list? (first tree)) (tree-min (first tree)))
               (else (first tree))
           ))
        ((list? (first tree)) (min (tree-min (first tree)) (tree-min (rest tree)) ))
        (else (min (first tree) (tree-min (rest tree))))
        )
  )


(display (tree-max '(3 (1 4)))) (newline) ;;  
(display (tree-min '(3 (1 4)))) (newline) ;;  

(newline)

;; Problem 7
(define (flatten tree)
  (cond ((null? tree) tree)
        ((list? (first tree)) (cons (flatten (first tree)) (flatten (rest tree))) )
        (else (cons (first tree) (flatten (rest tree))))
        )
  )

(display (flatten '(3 (1 4)))) (newline) ;;  

