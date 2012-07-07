class App.Sidebar extends Spine.Controller

  events:
    'click [data-type=posts]':        'posts'
    'click [data-type=new_post]':     'new_post'
    'click [data-type=users]':        'users'

  constructor: ->
    super
    @log('App Sidebar Controller!')
    @render()

  render: =>
    @log('App Sidebar render function')
    @html @view('sidebar/index')

  users:  =>
    App.User.fetch() unless App.User.count()
    # App.User.fetch()
    $(".nav-list > .active").removeClass("active")
    $("#all_users").addClass("active")
    @log("Clicked Users link")
    @navigate '/users'

  posts: =>
    $(".nav-list > .active").removeClass("active")
    $("#all_posts").addClass("active")

    @log("Clicked Posts link")
    @navigate '/posts'

  new_post: =>
    $(".nav-list > .active").removeClass("active")
    $("#add_post").addClass("active")
    @log("Clicked New Post link")
    @navigate '/posts/new'



