class App.Root extends Spine.Stack
  controllers:
    posts:		App.Posts
    users:      App.Users

  routes:
    '/posts' 	 : 'posts'
    '/users'     : 'users'

  default: 'posts'

  className: 'stack root'