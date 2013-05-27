vows = require 'vows'
assert = require 'assert'
wintersmith = require 'wintersmith'

suite = vows.describe 'Plugin'

suite.addBatch
  'wintersmith environment':
    topic: -> wintersmith './example/config.json'
    'loaded ok': (env) ->
      assert.instanceOf env, wintersmith.Environment
    'contents':
      topic: (env) -> env.load @callback
      'loaded ok': (result) ->
        assert.instanceOf result.contents, wintersmith.ContentTree
      'has plugin instances': (result) ->
        assert.instanceOf result.contents.redirects['test.html'], wintersmith.ContentPlugin
        assert.isArray result.contents.redirects._.redirects
        assert.lengthOf result.contents.redirects._.redirects, 2
      'has redirection script': (result) ->
        for item in result.contents.redirects._.redirects
          assert.match item.response.toString(), /window.location.href =/

suite.export module
