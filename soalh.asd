;;;; soalh.asd

(asdf:defsystem #:soalh
  :serial t
  :description "SOA in Lisp over HTTP"
  :author "Florian Margaine <florian@margaine.com>"
  :license "MIT License"
  :depends-on ("split-sequence"
               "alexandria"
               "usocket"
               "cl-ppcre"
               "bordeaux-threads")
  :components ((:file "package")
               (:file "conf")
               (:file "header")
               (:file "socket")
               (:file "soalh")))
