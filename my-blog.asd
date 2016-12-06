(in-package :cl-user)
(defpackage my-blog-asd
  (:use :cl :asdf))
(in-package :my-blog-asd)

(defsystem my-blog
  :version "0.1"
  :author "tzg157"
  :license ""
  :depends-on (:clack
               :lack
               :caveman2
               :envy
               :cl-ppcre
               :uiop
               ;; for @route annotation
               :cl-syntax-annot
               ;; HTML Template
               :djula
               ;; for DB
               :datafly
               :sxql)
  :components ((:module "src"
                :components
                ((:file "main" :depends-on ("config" "view" "db"))
                 (:file "web" :depends-on ("view"))
                 (:file "view" :depends-on ("config"))
                 (:file "db" :depends-on ("config"))
                 (:file "config")
				 (:module "dao"
				  :components 
				  ((:file "dao")
 				   (:file "user-dao" :depends-on ("dao"))))
				 (:module "modules" 
				  :components 
				  ((:file "modules"))
				   (:file "user" :depends-on ("modules")))))
  :description ""
  :in-order-to ((test-op (load-op my-blog-test))))
