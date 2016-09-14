#lang racket

;;; Student Name: Byron Wasti [change to your name]
;;;
;;; Check one:
;;; [X] I completed this assignment without assistance or external resources.
;;; [ ] I completed this assignment with assistance from ___
;;;     and/or using these external resources: ___

;;;;;;;;;;;
;; 1. assq

;; `assq` is a function that takes a key and an association list.
;;
;; It returns the corresponding key/value pair from the list
;; (*i.e.*, the pair whose key is *eq?* to the one it is given).
;;
;; If the key is not found in the list, `assq` returns `#f`.
(define (assq key asslist)
  (cond ((null? asslist) #f)
        ((eq? key (first (first asslist))) (first asslist))
        (else (assq key (rest asslist)))
        )
  )

(display '(assq) )(newline)
(assq 'hello '( ( new 1 ) ( oh 3 ) ( hello 4) ))

;;;;;;;;;;;
;; 2. lookup-list

;; Add the ability to look up symbols to your evaluator.
;;
;; Add the `lookup-list` argument to your hw2 evaluator (or ours, from the solution set).
;; `(evaluate 'foo lookup-list)` should return whatever `'foo` is associated with in `lookup-list`.

(define (calculate x)
  (cond ((number? x) x)
        ((eq? (first x) 'IPH) (if (calculate (second x)) (calculate (third x)) (calculate (fourth x) )) )
        ;; Due to the second argument being a list, this has to be a special case
        ((eq? (first x) 'evaluate) (assq (second x) (third x))) 
        (else ((cond  ((eq? (first x) 'ADD)+ )
                      ((eq? (first x) 'SUB) - )
                      ((eq? (first x) 'MUL) * )
                      ((eq? (first x) 'DIV) / )
                      ((eq? (first x) 'GT) > )
                      ((eq? (first x) 'LT) < )
                      ((eq? (first x) 'GE) >= )
                      ((eq? (first x) 'LE) <= )
                      ((eq? (first x) 'EQ) = )
                      ((eq? (first x) 'NEQ) (lambda (x y) (not (eq? x y))) )
                      ((eq? (first x) 'ANND) (lambda (x y) (and x y)) )
                      ((eq? (first x) 'ORR) (lambda (x y) (or x y)) )
                      ((eq? (first x) 'NOTT) (lambda (x y) (not x y)) )
                      (else (error "Don't know how to " (first x)))
                      ) (calculate (second x)) (calculate (third x)) )
              )
        )
  )

(display '(lookup-list)) (newline)
(calculate '(evaluate foo ( (test 1) (foo 3) )))
