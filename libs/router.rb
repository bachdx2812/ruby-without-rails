require 'singleton'

class Router
  # https://ruby-doc.org/3.2.0/stdlibs/singleton/Singleton.html?ref=writesoftwarewell.com
  include Singleton

  attr_reader :routers

  class << self
    def init(&block)
      Router.instance.instance_exec(&block)
    end
  end

  def initialize
    @routes = {}
  end

  def get(path, &block)
    @routes[path] = block
  end

  def build_response(path)
    handler = @routes[path] || -> { "No Defined Route Found for #{path}" }

    handler.call
  end
end
