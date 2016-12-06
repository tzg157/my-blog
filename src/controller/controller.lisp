(in-package :cl)
(defpackage :my-blog.controller
  (:documentation "controller package")
  (:use :cl
		:cl-user
		:caveman2
		:my-blog.module
		:my-blog.config)
    (:export *action*))

(in-package :my-blog.controller)

;; for @route annotation
(syntax:use-syntax :annot)

;;
;; Application

(defclass <web> (<app>) ())
(defvar *action* (make-instance '<web>))
(clear-routing-rules *action*)

@route GET "/admin/**"
(defun filter ()
  (format t "this is filter method."))

