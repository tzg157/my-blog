(in-package :my-blog.controller)

;;
@route POST "/admin/login"
(defun login (&key name password)
  (render #P"test.html"))
