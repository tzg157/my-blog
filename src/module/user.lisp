(in-package :my-blog.module)

(defclass user ()
  ((name
	:accessor name
	:initarg :name
	:initform (error "用户名不能为空.")
	)
   (password
	:accessor password
	:initarg :password
	:initform (error "密码不能为空.")
	)
   (mail
	:accessor mail
	:initarg :mail
	:initform (error "邮箱不能为空."))
   (sex
	:accessor sex
	:initarg :sex
	:initform 0
	:documentation "0-男,1-女")
   (phone
	:accessor phone
	:initarg :phone
	))
  )
