; escape.scm
(define (escape lst)
  (if (null? lst)
      '()
      (let ((x (car lst))
            (xs (cdr lst)))
        (if (negative? x)
            (cons (- x) (escape xs))
            (cons x (escape xs))))))
