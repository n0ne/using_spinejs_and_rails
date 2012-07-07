$.fn.item = ->
  elementID   = $(@).data('id')
  elementID or= $(@).parents('[data-id]').data('id')
  App.User.find(elementID)

class Index extends Spine.Controller
  events:
    'click [data-type=new_user]':        'new_user'
    'click [data-type=show]':            'show'
    'click [data-type=edit]':            'edit'

  constructor: ->
    super
    @log('App.Users Index Controller constructor')
    App.User.bind 'refresh change', @render
    App.User.fetch()


  render: =>
    @log('App.Users Index Controller render function')
    @users = App.User.all()
    @html @view('users/index')(users: @users)

  new_user: =>
    @log('App.Users Index Controller new_user function')
    @navigate '/users/new'

  show: (e) ->
    @log('App.Users Index Controller show function')
    @log($(e.target).item())
    item = $(e.target).item()
    @navigate '/users', item.id

  edit: (e) ->
    @log('App.Users Index Controller edit function')
    item = $(e.target).item()
    @log(item)
    @navigate '/users', item.id, 'edit'

class New extends Spine.Controller

  events:
    'submit form':              'submit'
    'click [data-type=cancel]': 'cancel'

  constructor: ->
    super
    @log('App.Users New Controller constructor')
    @log(@el)
    @render()

  render: =>
    @log('App.Users New Controller render function')
    @html @view('users/new')

  submit: (e) ->
    e.preventDefault()
    user = App.User.fromForm(e.target)
    if $('#new_admin').hasClass('active')
      user.admin = true
    else
      user.admin = false
    @log(user)
    user.save()
    # post = @item.fromForm(e.target).save()
    # @navigate '/posts'
    @navigate '/users', user.id if user
    # $(".nav-list > .active").removeClass("active")
    # $("#all_posts").addClass("active")

  cancel: ->
    @navigate '/users'
    # $(".nav-list > .active").removeClass("active")
    # $("#all_posts").addClass("active")

class Show extends Spine.Controller

  events:
    'click [data-type=back]': 'back'
    'click [data-type=edit]': 'edit'

  constructor: ->
    super
    @active (params) ->
      @change(params.id)

  change: (id) ->
    @item = App.User.find(id)
    @render()


  render: ->
    @html @view('users/show')(@item)

  back: ->
    @navigate '/users'

  edit: ->
    @navigate '/users', @item.id, 'edit'

class Edit extends Spine.Controller

  events:
    'submit form':              'submit'
    'click [data-type=cancel]': 'cancel'

  constructor: ->
    super
    @log('App.Users Edit Controller constructor')
    @active (params) ->
      @change(params.id)

  change: (id) ->
    @item = App.User.find(id)
    @render()

  render: ->
    $(".nav-list > .active").removeClass("active")
    $("#all_users").addClass("active")
    @log('App.Users Edit Controller render function')
    @html @view('users/edit')(@item)

  submit: (e) ->
    e.preventDefault()
    user = @item.fromForm(e.target)
    if $('#make_admin').hasClass('active')
      user.admin = true
    else
      user.admin = false
    @log(user)
    user.save()
    # post = @item.fromForm(e.target).save()
    # @navigate '/posts'
    @navigate '/users', user.id if user
    # $(".nav-list > .active").removeClass("active")
    # $("#all_posts").addClass("active")

  cancel: ->
    @navigate '/users'
    # $(".nav-list > .active").removeClass("active")
    # $("#all_posts").addClass("active")


class App.Users extends Spine.SubStack
  className: 'users stack'

  controllers:
    index: Index
    new:   New
    show:  Show
    edit:  Edit


  routes:
    '/users':          'index'
    '':                'index'
    '/users/new':      'new'
    '/users/:id':      'show'
    '/users/:id/edit': 'edit'

  default:  'index'

  className: 'stack users'