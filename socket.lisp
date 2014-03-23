;;;; http.lisp

(in-package #:soalh)

(defun socket-start ()
  (usocket:socket-server "0.0.0.0" 1234 #'socket-listener '() :multi-threading t))

(defun socket-listener (stream)
  ;; Only read the first line for efficiency
  (let ((request (read-line stream)))
    (destructuring-bind (method uri http-version)
        (header-parse request)
      (declare (ignore method))
      (declare (ignore http-version))
      (block stop-map
        (maphash #'(lambda (route service)
                     (when (ppcre:scan route uri)
                       ;; Read the rest of the request
                       (let ((host (car service))
                             (port (cadr service))
                             (req (header-build request stream)))
                         (socket-service req host port))
                       (return-from stop-map)))
                 *routes*))))
  (format stream "Hello, world!"))

(defun socket-service (request service-host service-port)
  (let ((service-socket (usocket:socket-connect service-host service-port)))
    (write-string request (usocket:socket-stream service-socket))
    (force-output (usocket:socket-stream service-socket))))
