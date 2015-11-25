require 'test_helper'

class MiddlewareTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Chops::Middleware.new(parent_app)
  end

  def parent_app
    proc{[500, {}, 'Hello World']}
  end

  def test_request_without_chops_header
    get('/')
    # passes request to parent
    assert last_response.body.include?(parent_app.call[2])
  end

  def test_request_with_chops_header
    header Chops::Middleware::CHOPS_HEADER, ''
    get '/'#, Chops::Middleware::CHOPS_HEADER => ''
    # chops consumes request
    refute last_response.body.include?(parent_app.call[2])
  end
end
