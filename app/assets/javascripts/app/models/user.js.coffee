class App.User extends Spine.Model

  @configure 'User', 'nickname', 'email', 'admin', 'created_at', 'updated_at'

  @extend Spine.Model.Ajax