(in-package :my-blog.dao)

;;查询用户
(defun query-user (name password)
  (with-connection (my-blog.db:db :maindb)
	(retrieve-one
	 (select :*
			 (from :blog_user)
			 (where (:and 
					 (:= :name name)
					 (:= :password password)))))))

;;添加用户
(defun add-user (name password mail &key sex phone)
  ())

;;修改用户信息
(defun update-user (&key password sex phone)
  ())
