`import Ember from 'ember'`

ListsShowController = Ember.Controller.extend
  actions:
    delete: (model) ->
      model.destroyRecord().then =>
        @transitionToRoute 'lists.index'

`export default ListsShowController`
