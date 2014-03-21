;;;; http.lisp

(in-package #:soalh)

(defun socket-start ()
  (usocket:socket-server "0.0.0.0" 1234 #'socket-listener '() :in-new-thread nil))

(defun socket-listener (stream)
  (declare (type stream stream))
  (let ((line (read-line stream)))
    (format t "~A~%" line))
  (format stream "Hello, world!"))
