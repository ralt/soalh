;;;; http.lisp

(in-package #:soalh)

(defun socket-start ()
  (usocket:socket-server "0.0.0.0" 1234 #'socket-listener))

(defun socket-listener (stream)
  (declare (type stream stream))
  (format stream "Hello world!"))
