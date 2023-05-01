; main.scm
(load "./escape.scm")

(define (read-input)
  (let loop ((lst '()))
    (let ((num (read)))
      (if (eof-object? num)
          (reverse lst)
          (loop (cons num lst))))))

(define (main)
  (let ((input (read-input)))
    (display "Input list: ")
    (display input)
    (newline)
    (display "Result: ")
    (display (escape input))
    (newline)))

(main)
