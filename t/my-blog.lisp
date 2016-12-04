(in-package :cl-user)
(defpackage my-blog-test
  (:use :cl
        :my-blog
        :prove))
(in-package :my-blog-test)

(plan nil)

;; blah blah blah.

(finalize)
