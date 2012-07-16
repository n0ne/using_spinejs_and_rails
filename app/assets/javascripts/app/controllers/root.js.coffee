class App.Root extends Spine.Stack
  controllers:
    posts:		App.Posts
    users:    App.Users
    records:	App.Records
    pictures: App.Pictures
    help:     App.Help

  routes:
    '/posts' 	   : 'posts'
    '/users'     : 'users'
    '/records'   : 'records'
    '/pictures'  : 'pictures'
    '/help'      : 'help'

  default: 'posts'

  className: 'stack root'