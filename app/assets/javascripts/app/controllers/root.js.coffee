class App.Root extends Spine.Stack
  controllers:
    posts:		App.Posts
    users:    App.Users
    records:	App.Records
    pictures: App.Pictures

  routes:
    '/posts' 	   : 'posts'
    '/users'     : 'users'
    '/records'   : 'records'
    '/pictures'  : 'pictures'

  default: 'posts'

  className: 'stack root'