class Index extends Spine.Controller
  constructor: ->
    super
    @log('App.Posts Index Controller constructor')
    @log(@el)
    @render()


  render: =>
    @log('App.Posts Index Controller render function')
    @html @view('posts/index')


class App.Posts extends Spine.SubStack
  className: 'posts stack'

  controllers:
    index: Index


  routes:
    '/posts':          'index'
    '':                'index'

  default:  'index'

  className: 'stack posts'