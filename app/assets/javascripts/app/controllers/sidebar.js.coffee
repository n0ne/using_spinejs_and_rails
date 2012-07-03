class App.Sidebar extends Spine.Controller

  events:
    'click [data-type=posts]':        'posts'
    'click [data-type=users]':        'users'

  constructor: ->
    super
    @log('App Sidebar Controller!')
    @render()

  render: =>
    @log('App Sidebar render function')
    @html @view('sidebar/index')

  users:  =>
    @log("Clicked Users link")
    @navigate '/users'

  posts: =>
    @log("Clicked Posts link")
    @navigate '/posts'



