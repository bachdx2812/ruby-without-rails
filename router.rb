class Router
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
