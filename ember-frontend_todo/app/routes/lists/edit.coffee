`import Ember from 'ember'`

ListsShowRoute = Ember.Route.extend
  model: (params) -> @store.findRecord('list', params.list_id)

  deactivate: -> @get('controller.model').rollbackAttributes()

`export default ListsShowRoute`
