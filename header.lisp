;;;; header.lisp

(in-package #:soalh)

(defun header-parse (line)
  (declare (type string line))
  (values (split-sequence:split-sequence #\Space line)))
