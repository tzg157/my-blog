(in-package :cl)
(defpackage :my-blog.dao
  (:documentation "dao package")
  (:use :cl
		:cl-user
		:my-blog.db
		:my-blog.config
		:datafly
		:sxql)
    (:export :user-dao))
