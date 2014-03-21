;;;; soalh.asd

(asdf:defsystem #:soalh
  :serial t
  :description "SOA in Lisp over HTTP"
  :author "Florian Margaine <florian@margaine.com>"
  :license "MIT License"
  :depends-on ("split-sequence"
               "alexandria"
               "usocket")
  :components ((:file "package")
               (:file "conf")
               (:file "http")
               (:file "soalh")))
