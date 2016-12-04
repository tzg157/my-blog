(in-package :cl-user)
(defpackage my-blog-test-asd
  (:use :cl :asdf))
(in-package :my-blog-test-asd)

(defsystem my-blog-test
  :author "tzg157"
  :license ""
  :depends-on (:my-blog
               :prove)
  :components ((:module "t"
                :components
                ((:file "my-blog"))))
  :perform (load-op :after (op c) (asdf:clear-system c)))
