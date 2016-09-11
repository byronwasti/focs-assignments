#lang racket

;;; Student Name: Byron Wasti [change to your name]
;;;
;;; Check one:
;;; [X] I completed this assignment without assistance or external resources.
;;; [ ] I completed this assignment with assistance from ___
;;;     and/or using these external resources: ___

;;; 1.  Create a calculator that takes one argument: a list that represents an expression.
(define (calculate x)
  (if (number? x)
    x
    ((cond  ((eq? (first x) 'ADD)+ )
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
            ) (calculate (second x)) (calculate (third x)) )
      )
  )

(calculate '(ADD 3 4)) ;; --> 7
(calculate '(SUB 3 4)) ;; --> -1
(calculate '(MUL 3 4)) ;; --> 12
(calculate '(DIV 3 4)) ;; --> 3/4

;;; 2. Expand the calculator's operation to allow for arguments that are themselves well-formed arithmetic expressions.

(calculate '(ADD 3 (MUL 4 5))) ;; --> 23   ;; what is the equivalent construction using list?
(calculate '(SUB (ADD 3 4) (MUL 5 6))) ;; --> -23

;;; 3. Add comparators returning booleans (*e.g.*, greater than, less than, …).
;; Note that each of these takes numeric arguments (or expressions that evaluate to produce numeric values),
;; but returns a boolean.  We suggest operators `GT`, `LT`, `GE`, `LE`, `EQ`, `NEQ`.

	(calculate '(GT (ADD 3 4) (MUL 5 6))) ;; --> #f
	(calculate '(LE (ADD 3 (MUL 4 5)) (SUB 0 (SUB (ADD 3 4) (MUL 5 6))))) ;; --> #t
	(calculate '(NEQ (LE (ADD 3 (MUL 4 5)) (SUB 0 (SUB (ADD 3 4) (MUL 5 6)))) 3)) ;; --> #t

;;; 4. Add boolean operations ANND, ORR, NOTT

;;(display (calculate '(ORR (ANND (GT (ADD 3 4) (MUL 5 6)) (LE (ADD 3 (MUL 4 5)) (SUB 0 (SUB (ADD 3 4) (MUL 5 6)))) )))) ;; --> #f
(calculate '(ANND (GT (ADD 3 4) (MUL 5 6)) (LE (ADD 3 (MUL 4 5)) (SUB 0 (SUB (ADD 3 4) (MUL 5 6))))) )

;;; 5. Add IPH

#|
(calculate '(IPH (GT (ADD 3 4) 7) (ADD 1 2) (ADD 1 3))) ;; -> 4
|#
