class Index extends Spine.Controller
  events:
    'click [data-type=new_user]':        'new_user'

  constructor: ->
    super
    @log('App.Users Index Controller constructor')
    @log(@el)
    @render()


  render: =>
    @log('App.Users Index Controller render function')
    @html @view('users/index')

  new_user: =>
    @log('App.Users Index Controller new_user function')
    @navigate '/new'

class New extends Spine.Controller

  events:
    'click [data-type=all_users]':        'all_users'

  constructor: ->
    super
    @log('App.Users New Controller constructor')
    @log(@el)
    @render()


  render: =>
    @log('App.Users New Controller render function')
    @html @view('users/new')

  all_users: =>
    @log('App.Users New Controller all_users function')
    @navigate '/users'


class App.Users extends Spine.SubStack
  className: 'users stack'

  controllers:
    index: Index
    new:   New


  routes:
    '/users':          'index'
    '':                'index'
    '/new':            'new'

  # default:  'index'

  className: 'stack users'