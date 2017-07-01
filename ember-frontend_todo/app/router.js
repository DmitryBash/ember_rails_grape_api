import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType,
  rootURL: config.rootURL
});

Router.map(function() {
  this.route('lists', function () {
    this.route('index', { path: '/' });
    this.route('show', { path: ':list_id' });
    this.route('edit', { path: ':list_id/edit' });
    this.route('new');
  });
});

export default Router;
