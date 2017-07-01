`import Ember from 'ember'`

ListsNewController = Ember.Controller.extend
  actions:
    save: ->
      @get('model').save().then =>
        @transitionToRoute 'lists.show', @get('model')

    cancel: -> @transitionToRoute 'lists.show', @get('model')

`export default ListsNewController`
