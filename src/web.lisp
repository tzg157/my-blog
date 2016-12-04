(in-package :cl-user)
(defpackage my-blog.web
  (:use :cl
        :caveman2
        :my-blog.config
        :my-blog.view
        :my-blog.db
        :datafly
        :sxql)
  (:export :*web*))
(in-package :my-blog.web)

;; for @route annotation
(syntax:use-syntax :annot)

;;
;; Application

(defclass <web> (<app>) ())
(defvar *web* (make-instance '<web>))
(clear-routing-rules *web*)

;;
;; Routing rules
;; index
(defroute "/" ()
  (render #P"index.html"))

;;
@route GET "/welcome/:name"
(defun welcome (&key name)
  (render #P"test.html"))

;;
;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
  (declare (ignore app))
  (merge-pathnames #P"_errors/404.html"
                   *template-directory*))
