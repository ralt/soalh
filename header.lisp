;;;; header.lisp

(in-package #:soalh)

(defun header-parse (line)
  (values (split-sequence:split-sequence #\Space line)))

(defun header-build (request stream)
  ;; At this point, the stream doesn't have the first line of the request,
  ;; it is already in the "request" string.
  (format nil
          "~a~C~C~{~a~C~C~}~C~C"
          request
          #\Return
          #\Linefeed
          (alexandria:flatten (loop for line = (read-line stream nil 'eos)
                                 until (eq line 'eos)
                                 collect (list line #\Return #\Linefeed)))
          #\Return
          #\Linefeed))
