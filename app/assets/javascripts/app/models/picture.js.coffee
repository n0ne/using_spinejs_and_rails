class App.Picture extends Spine.Model

  @configure 'Picture', 'image'

  # @extend Spine.Model.Ajax

  # @extend Spine.Model.Ajax.Methods

  # @fetch (params) =>
  #   index  = @last()?.id or 0
  #   return false if index is @index
  #   @index = index

  #   params or=
  #     data: {index: @index}
  #     processData: true

  #   @ajax().fetch(params)
  #   true

  @extend Spine.Model.Ajax

  @fetch_few: () =>
    index  = @last()?.id or 0
    return false if index is @index
    @index = index

    params =
      data: {index: @index}
      url: '/pictures'
      processData: true

    @ajax().fetch(params)