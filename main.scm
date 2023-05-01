; main.scm
(define *input* '())

(define (escape)
  (call/cc
   (lambda (return)
     (for-each (lambda (x)
                 (if (negative? x)
                     (return x)))
               *input*)
     #f)))

(define (test-escape)
  (let ((test-cases (list (cons (list 1 2 3 -4 5 6) -4)
                           (cons (list 1 2 3 4 5 6) #f)
                           (cons (list -1 2 3 -4 5 6) -1)
                           (cons (list 1 2 3 4 -5 -6) -5))))
    (for-each
     (lambda (test-case)
       (let* ((input (car test-case))
              (expected-output (cdr test-case))
              (output (begin (set! *input* input) (escape))))
         (if (equal? output expected-output)
             (display (string-append "Test passed for input: " (number->string (length input)) " elements\n"))
             (display (string-append "Test failed for input: " (number->string (length input)) " elements\n")))))
     test-cases)))

(test-escape)
