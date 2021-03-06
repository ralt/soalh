;;;; conf.lisp

(in-package #:soalh)

(defun conf-read (filename)
  (with-open-file (stream filename)
    (loop for line = (read-line stream nil 'eof)
       until (eq line 'eof)
       do (setf line (conf-line-parse line))
       when (conf-line-valid line)
       do (conf-line-add line))))

(defun conf-line-valid (line)
  (let ((ret t))
    (unless (eq (length line) 3)
      (setf ret nil))
    ret))

(defun conf-line-parse (line)
  (split-sequence:split-sequence #\Space line))

(defun conf-line-add (line)
  ;; (:route '(service-host service-port))
  (setf (gethash (car line) *routes*) (list (cadr line) (parse-integer (caddr line)))))
