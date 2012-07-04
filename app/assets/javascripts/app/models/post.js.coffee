class App.Post extends Spine.Model

  @configure 'Post', 'title', 'body', 'created_at', 'updated_at'

  @extend Spine.Model.Ajax

  @fetch_one: (post_id) =>
    params =
      data: {id: post_id}
      url: '/posts/fetch_one'
      processData: true

    @ajax().fetch(params)