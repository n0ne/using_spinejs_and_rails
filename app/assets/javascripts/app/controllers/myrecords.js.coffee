
class Index extends Spine.Controller
  events:
    'click [data-type=destroy]':    'destroy'

  constructor: ->
    super
    @log('App.Record Index Controller constructor')
    App.Record.bind 'refresh change', @render
    # App.Record.fetch()
    # @log(App.Users.index.isActive())


  render: =>
    @log('App.Record Index Controller render function')
    @records = App.Record.all()
    @html @view('records/index')(records: @records)

  destroy: (e) ->
    recID = $(e.target).parent().parent().data('id')
    record = App.Record.find(recID)
    record.destroy() if confirm('Sure?')



class App.Records extends Spine.SubStack
  className: 'records stack'

  controllers:
    index: Index


  routes:
    '/records':          'index'

  className: 'stack records'