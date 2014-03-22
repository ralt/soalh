;;;; soalh.lisp

(in-package #:soalh)

(defvar *routes* (make-hash-table :test 'equal))

;;; "soalh" goes here. Hacks and glory await!
(defun main (filename)
  (declare (type string filename))
  (conf-read filename)
  (socket-start))
