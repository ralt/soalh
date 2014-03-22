;;;; http.lisp

(in-package #:soalh)

(defun socket-start ()
  (usocket:socket-server "0.0.0.0" 1234 #'socket-listener '() :multi-threading t))

(defun socket-listener (stream)
  (destructuring-bind (method uri http-version)
      (header-parse (read-line stream))
    (declare (ignore method))
    (declare (ignore http-version))
    (block stop-map
      (maphash #'(lambda (route service)
                   (declare (type string route))
                   (declare (type string service))
                   (when (ppcre:scan route uri)
                     (format t "Route: ~A, Service: ~A~%" route service)
                     (socket-service stream)
                     (return-from stop-map)))
               *routes*)))
  (format stream "Hello, world!"))

(defun socket-service (client-stream))
