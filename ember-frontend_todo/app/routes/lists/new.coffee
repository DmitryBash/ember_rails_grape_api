`import Ember from 'ember'`

ListsNewRoute = Ember.Route.extend
  model: -> @store.createRecord('list')

  deactivate: -> @get('controller.model').rollbackAttributes()

`export default ListsNewRoute`
