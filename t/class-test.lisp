(in-package :cl-user)

(defpackage foo-package
  (:use :cl
		:cl-user)
  (:export :foo
		   ))

(in-package :foo-package)

(defclass foo ()
			((f1
			  :accessor f1
			  :initform "foo-class")
			 (f2
			  :accessor f2
			  :initform "f2-slot-value")))
