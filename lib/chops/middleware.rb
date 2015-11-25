require 'rack'

module Chops
  class Middleware
    CHOPS_HEADER = 'X-Chops'.freeze

    def initialize(app)
      @app = app
    end

    def call(env)
      return @app.call(env) unless env.key?('HTTP_X_CHOPS')
      [200, {}, '']
    end
  end
end
