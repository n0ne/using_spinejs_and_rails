class App.Post extends Spine.Model

  @configure 'Post', 'title', 'body', 'created_at', 'updated_at'

  @extend Spine.Model.Ajax

  @fetch (params) ->
    index  = @last()?.id or 0
    return false if index is @index
    @index = index

    params or=
      data: {index: index}
      processData: true

    @ajax().fetch(params)



  # @next_page: (post_id) =>
  #   params =
  #     data: {id: post_id}
  #     url: '/posts/next_page'
  #     processData: true

  #   @ajax().fetch(params)

  # @prev_page: (post_id) =>
  #   params =
  #     data: {id: post_id}
  #     url: '/posts/prev_page'
  #     processData: true

  #   @ajax().fetch(params)

  # @refresh: (post_id) =>
  #   params =
  #     data: {id: post_id}
  #     url: '/posts/refresh'
  #     processData: true

    # @ajax().fetch(params)