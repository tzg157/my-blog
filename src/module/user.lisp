(use-package '(:my-blog.db :datafly :sxql))

(import 'my-blog.config "APP_ENV")

(setf (osicat:environment-variable "APP_ENV") "development")
(config :debug)
