class Index extends Spine.Controller

  constructor: ->
    super
    @log('App.Help Index Controller constructor')
    @html @view('help/index')

class App.Help extends Spine.SubStack
  className: 'help stack'

  controllers:
    index: Index


  routes:
    '/help':          'index'

  className: 'stack help'