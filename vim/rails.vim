Bundle 'tpope/vim-rails'

let g:rails_projections = {
\ "app/constraints/*_constraint.rb": {
\   "command": "constraint",
\   "template": "class %SConstraint\nend",
\   "test": [
\     "spec/constraints/%s_constraint_spec.rb"
\   ]
\ },
\ "app/jobs/*_job.rb": {
\   "command": "job",
\   "template": "class %SJob\nend",
\   "test": [
\     "spec/jobs/%s_job_spec.rb"
\   ]
\ },
\ "app/policies/*_policy.rb": {
\   "command": "policy",
\   "template": "class %SPolicy\n  class Scope\n  end\nend",
\   "test": [
\     "spec/policies/%s_policy_spec.rb"
\   ]
\ },
\ "app/decorators/*_decorator.rb": {
\   "command": "decorator",
\   "template": "class %SDecorator < Draper::Decorator\nend",
\   "test": [
\     "spec/decorators/%s_decorator_spec.rb"
\   ]
\ },
\ "app/serializers/*_serializer.rb": {
\   "command": "serializer",
\   "template": "class %SSerializer < ActiveModel::Serializer\nend",
\   "test": [
\     "spec/serializers/%s_serializer_spec.rb"
\   ]
\ },
\ "app/assets/javascripts/routers/*.coffee": {
\   "command": "jrouter",
\   "template":
\     "class @App.Routers.%S extends Backbone.Router",
\   "test": [
\     "spec/javascripts/routers/%s_spec.coffee",
\     "spec/javascripts/routers/%s_spec.js"
\   ]
\ },
\ "app/assets/javascripts/utils/*.coffee": {
\   "command": "jutil",
\   "template":
\     "class @App.Utils.%S",
\   "test": [
\     "spec/javascripts/utils/%s_spec.coffee",
\     "spec/javascripts/utils/%s_spec.js"
\   ]
\ },
\ "app/assets/javascripts/collections/*.coffee": {
\   "command": "jcollection",
\   "template":
\     "class @App.Collections.%S extends Backbone.Collection",
\   "test": [
\     "spec/javascripts/collections/%p_spec.coffee",
\     "spec/javascripts/collections/%p_spec.js"
\   ]
\ },
\ "app/assets/javascripts/models/*.coffee": {
\   "command": "jmodel",
\   "template":
\     "class @App.Models.%S extends Backbone.Model",
\   "test": [
\     "spec/javascripts/models/%s_spec.coffee",
\     "spec/javascripts/models/%s_spec.js"
\   ]
\ },
\ "app/assets/javascripts/views/*.coffee": {
\   "command": "jview",
\   "template":
\     "class @App.Views.%S extends Support.CompositeView",
\   "related": "app/assets/templates/%s.jst.ejs",
\   "test": [
\     "spec/javascripts/views/%s_spec.coffee",
\     "spec/javascripts/views/%s_spec.js"
\   ]
\ },
\ "app/assets/templates/*.jst.ejs": {
\   "command": "template",
\   "alternate": [
\     "app/assets/javascripts/views/%s.coffee",
\     "app/assets/javascripts/views/%s.js"
\   ]
\ },
\ "spec/javascripts/*_spec.coffee": {
\   "command": "jspec",
\   "alternate": [
\     "app/assets/javascripts/%s.coffee",
\     "app/assets/javascripts/%s.js",
\     "lib/assets/javascripts/%s.coffee",
\     "lib/assets/javascripts/%s.js"
\   ]
\ },
\ "config/routes.rb": {"command": "routes"},
\ "spec/features/*_spec.rb": {"command": "feature"},
\ "spec/requests/*_spec.rb": {"command": "feature"},
\ "spec/support/*.rb": {"command": "support"},
\ "spec/factories.rb": {"command": "factories"},
\ "spec/factories/*.rb": {"command": "factories"}
\ }
