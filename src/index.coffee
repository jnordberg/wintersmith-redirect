url = require 'url'

module.exports = (env, callback) ->

  class Redirect extends env.ContentPlugin
    constructor: (@from, @to) ->
      @to = url.resolve env.config.baseUrl, @to
      @response = new Buffer """
        <h1>Moved Permanently</h1>
        <a href="#{ @to }">#{ @to }</a>
        <script>window.location.href = '#{ @to }';</script>
      """
    getFilename: -> @from
    getView: -> (args..., callback) -> callback null, @response


  tree = {redirects: {}}
  for filename, redirect of env.config.redirects or {}
    tree.redirects[filename] = new Redirect filename, redirect
    env.logger.info "Redirecting #{ filename } to #{ redirect }"

  env.registerGenerator 'redirects', (contents, callback) ->
    callback null, tree

  callback()
