$.fn.item = ->
  elementID   = $(@).data('id')
  elementID or= $(@).parents('[data-id]').data('id')
  App.Post.find(elementID)

class Index extends Spine.Controller

  className: "all_users"

  events:
    'click [data-type=show]':       'show'
    'click [data-type=edit]':       'edit'
    'click [data-type=destroy]':    'destroy'
  constructor: ->
    super
    # $.getJSON "posts/ids", (data) ->
    #   $("#first").text(data.first_id)
    #   $("#last").text(data.last_id)
    @log('App.Posts Index Controller constructor')
    App.Post.bind 'refresh change', @render
    App.Post.fetch()

  render: =>
    @log('App.Posts Index Controller render function')
    @posts = App.Post.all()
    @html @view('posts/index')(posts: @posts)



  show: (e) ->
    @log('App.Posts Index Controller show function')
    @log($(e.target).parent().parent().data('id'))
    itemID = $(e.target).parent().parent().data('id')
    @navigate '/posts', itemID

  edit: (e) ->
    @log('App.Posts Index Controller edit function')
    itemID = $(e.target).parent().parent().data('id')
    @navigate '/posts', itemID, 'edit'

  destroy: (e) ->
    itemID = $(e.target).parent().parent().data('id')
    post = App.Post.find(itemID)
    post.destroy() if confirm('Sure?')

class New extends Spine.Controller

  events:
    'submit form': 'submit'
    'click [data-type=cancel]': 'cancel'

  constructor: ->
    super
    @log('App.Posts New Controller constructor')
    @log(@el)
    @active @render

  render: =>
    $(".nav-list > .active").removeClass("active")
    $("#add_post").addClass("active")
    @log('App.Posts New Controller render function')
    @html @view('posts/new')

  submit: (e) ->
    e.preventDefault()
    @log(e.target)
    post = App.Post.fromForm(e.target).save()
    @navigate '/posts', post.id if post
    $(".nav-list > .active").removeClass("active")
    $("#all_posts").addClass("active")

  cancel: ->
    @navigate '/posts'
    $(".nav-list > .active").removeClass("active")
    $("#all_posts").addClass("active")

class Edit extends Spine.Controller

  events:
    'submit form': 'submit'
    'click [data-type=cancel]': 'cancel'

  constructor: ->
    super
    @log('App.Posts Edit Controller constructor')
    @active (params) ->
      @change(params.id)

  change: (id) ->
    @item = App.Post.find(id)
    @render()

  render: ->
    $(".nav-list > .active").removeClass("active")
    $("#add_post").addClass("active")
    @log('App.Posts Edit Controller render function')
    @html @view('posts/edit')(@item)

  submit: (e) ->
    e.preventDefault()
    post = @item.fromForm(e.target).save()
    @navigate '/posts', post.id if post
    $(".nav-list > .active").removeClass("active")
    $("#all_posts").addClass("active")

  cancel: ->
    @navigate '/posts'
    $(".nav-list > .active").removeClass("active")
    $("#all_posts").addClass("active")

class Show extends Spine.Controller

  events:
    'click [data-type=back]': 'back'
    'click [data-type=edit]': 'edit'

  constructor: ->
    super
    @active (params) ->
      @change(params.id)

  change: (id) ->
    @item = App.Post.find(id)
    @render()


  render: ->
    @html @view('posts/show')(@item)

  back: ->
    # App.Post.refresh
    @navigate '/posts', trigger: true

  edit: ->
    @navigate '/posts', @item.id, 'edit'


class App.Posts extends Spine.SubStack
  className: 'posts stack'

  controllers:
    index: Index
    new:   New
    show:  Show
    edit:  Edit


  routes:
    '/posts':          'index'
    '':                'index'
    '/posts/new':      'new'
    '/posts/:id':      'show'
    '/posts/:id/edit': 'edit'

  # default:  'index'

  className: 'stack posts'