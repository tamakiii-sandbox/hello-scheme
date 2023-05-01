(define *input* '())

(define (escape)
  (call/cc
   (lambda (return)
     (for-each (lambda (x)
                 (if (negative? x)
                     (return x)))
               *input*)
     #f)))
