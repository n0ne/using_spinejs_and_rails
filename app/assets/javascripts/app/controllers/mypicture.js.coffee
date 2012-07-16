class Index extends Spine.Controller
  elements:
    '.picture_list':    'items'
    'footer':           'footer'
    '.loading':         'loading'

  events:
    'click [data-type=destroy]':    'destroy'
    'click [data-type=show]':       'show'

  constructor: ->
    super
    @log('App.Picture Index Controller constructor')
    @html @view('pictures/index')()

    App.Picture.bind 'refresh', =>
      @render(arguments...)

    App.Picture.fetch_few()

  render: (items = []) =>
    @log('App.Pictures Index Controller render function')
    for item in items
      @log(item)
      @items.append @view('pictures/item')(item)

  show: (e) ->
    @log('App.Posts Index Controller show function')
    @log($(e.target).parent().parent().data('id'))
    itemID = $(e.target).parent().parent().data('id')
    @navigate '/pictures', itemID

  destroy: (e) ->
    picID = $(e.target).parent().parent().data('id')
    picture = App.Picture.find(picID)
    picture.destroy() if confirm('Sure?')
    $(e.target).parent().parent().fadeOut()


class Show extends Spine.Controller

  events:
    'click [data-type=back]': 'back'

  constructor: ->
    super
    @active (params) ->
      @change(params.id)

  change: (id) ->
    @item = App.Picture.find(id)
    @log(@item)
    @render()


  render: ->
    @html @view('pictures/show')(@item)

  back: ->
    @navigate '/pictures', trigger: true


class App.Pictures extends Spine.SubStack

  className: 'pictures stack'

  controllers:
    index:                Index
    show:                 Show


  routes:
    '/pictures':          'index'
    '/pictures/:id':      'show'

  default:    'index'

  className: 'stack pictures'