; test/escape.test.scm
(load "../escape.scm")

(define *test-cases*
  '((() . ())
    ((1 2 3 -4 -5 6) . (1 2 3 4 5 6))
    ((-1 -2 -3 4 5 -6) . (1 2 3 4 5 6))
    ((1 1 1 1 -1 -1 -1) . (1 1 1 1 1 1 1))))

(for-each
 (lambda (test-case)
   (let ((input (car test-case))
         (expected (cdr test-case)))
     (let ((result (escape input)))
       (unless (equal? result expected)
         (format #t "Failed for input ~A. Expected ~A, but got ~A.~%"
                 input expected result)))))
 *test-cases*)
