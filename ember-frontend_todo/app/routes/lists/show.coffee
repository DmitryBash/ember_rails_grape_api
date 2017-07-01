`import Ember from 'ember'`

ListsShowRoute = Ember.Route.extend
  model: (params) -> @store.findRecord('list', params.list_id)

`export default ListsShowRoute`
