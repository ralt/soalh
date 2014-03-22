;;;; header.lisp

(in-package #:soalh)

(defun header-parse (line)
  (values (split-sequence:split-sequence #\Space line)))
