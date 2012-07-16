class App.Sidebar extends Spine.Controller

  events:
    'click [data-type=posts]':        'posts'
    'click [data-type=new_post]':     'new_post'
    'click [data-type=users]':        'users'
    'click [data-type=media]':        'records'
    'click [data-type=pictures]':     'pictures'

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

  records: =>
    $(".nav-list > .active").removeClass("active")
    $("#all_media").addClass("active")
    App.Record.fetch() unless App.Record.count()
    @log("Clicked Records link")
    @navigate '/records'

  pictures: =>
    # App.Picture.fetch() unless App.Picture.count()
    # $('.picture_footer').waypoint(offset: '70%')
    # new App.Pictures
    $(".nav-list > .active").removeClass("active")
    $("#all_pictures").addClass("active")
    # App.Picure.fetch() unless App.Record.count()
    @log("Clicked Pictures link")
    @navigate '/pictures'



