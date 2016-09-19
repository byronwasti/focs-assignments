#lang racket

;;; Student Name: Byron Wasti [change to your name]
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [ ] I completed this assignment with assistance from ___
;;;     and/or using these external resources: ___

(define (assq key asslist)
  (cond ((null? asslist) #f)
        ((eq? key (first (first asslist))) (first asslist))
        (else (assq key (rest asslist)))
        )
  )

(define operator-list
  (list (list 'ADD +)
        (list 'SUB -)
        (list 'MUL *)
        (list 'DIV /)
        (list 'GT >)
        (list 'LT <)
        (list 'GE >=)
        (list 'LE <=)
        (list 'EQ =)
        (list 'NEQ (lambda (x y) (not (= x y))))
        (list 'ANND (lambda (x y) (and x y)))
        (list 'ORR (lambda (x y) (or x y)))
        (list 'NOTT not))
  )

(define (evaluator sentence environment)
  (cond ((number? sentence) sentence)
        ;;((not (assq (first sentence) environment)) 
            ;;(error "Don't know how to " (first sentence) ))
        ((assq sentence environment)
            (second (assq sentence environment))
            )
        ((eq? (first sentence) 'IPH) 
            (if (evaluator (second sentence) environment)
                (evaluator (third sentence) environment)
                (evaluator (fourth sentence) environment) )
            )
        ((eq? (first sentence) 'LAMBDA)
            ;;(list 'LAMBDA (second sentence) (third sentence) ))
            (lambda (second sentence) (third sentence))
            )
        ((eq? (first sentence) 'DEFINE)
            ;; This allows new DEFINEs to "overwrite" old ones
            (repl (cons (list (second sentence) (third sentence)) environment)) 
            )
        ((assq (first sentence) operator-list)
            ((second (assq (first sentence) operator-list)) 
                (evaluator (second sentence) environment)
                (evaluator (third sentence) environment))
            )
        ((list? (first sentence))
            (evaluator (first sentence) environment)
            )
        (else (error "Don't know how to " (first sentence)))
    )
  )

(define (repl environment)
  (display environment)
  (display "> ")
  (display (evaluator (read) environment))
  (newline)
  (repl environment)
  )

;;(evaluator '(ADD 1 2) empty)
(repl empty)
