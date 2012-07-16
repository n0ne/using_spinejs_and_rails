class App.Post extends Spine.Model

  @configure 'Post', 'title', 'body', 'created_at', 'updated_at'

  @extend Spine.Model.Ajax

  @fetch_few: () =>
    index  = @last()?.id or 0
    return false if index is @index
    @index = index

    params =
      data: {index: @index}
      url: '/posts'
      processData: true

    @ajax().fetch(params)
