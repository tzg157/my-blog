(in-package :cl-user)
(defpackage my-blog.config
  (:use :cl)
  (:import-from :envy
                :config-env-var
                :defconfig)
  (:export :config
           :*application-root*
           :*static-directory*
           :*template-directory*
           :appenv
           :developmentp
           :productionp))
(in-package :my-blog.config)

(setf (config-env-var) "APP_ENV")

(defparameter *application-root*   (asdf:system-source-directory :my-blog))
(defparameter *static-directory*   (merge-pathnames #P"static/" *application-root*))
(defparameter *template-directory* (merge-pathnames #P"templates/" *application-root*))

(defconfig :common
  `(:databases 
	((:maindb :mysql :database-name "blog" :host "localhost" :port 3306 :username "blog" :password "6yhn&UJM")
	 (:maindb :sqlite3 :database-name ":memory:"))))

(defconfig |development|
  '(:databases (:maindb :mysql :database-name ":blog:" :username "root" :password "01830728lx" :port 3306)))

(defconfig |production|
  '())

(defconfig |test|
  '())

(defun config (&optional key)
  (envy:config #.(package-name *package*) key))

(defun appenv ()
  (uiop:getenv (config-env-var #.(package-name *package*))))

(defun developmentp ()
  (string= (appenv) "development"))

(defun productionp ()
  (string= (appenv) "production"))
