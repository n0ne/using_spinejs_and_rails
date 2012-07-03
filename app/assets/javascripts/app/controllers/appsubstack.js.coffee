class Spine.SubStack extends Spine.Stack

  constructor: ->
    for key,value of @routes
      do (key,value) =>
        @routes[key] = =>
          @active()
          @[value].active(arguments...)
    super