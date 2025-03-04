require 'webrick'

class ControlServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    query = request.query

    angle = query["angle"].to_i
    Kani.instance.angle = angle

    response.status = 200
    response['Content-Type'] = 'text/html'
    response.body = '<html><body>done.</body></html>'
  end
end


class Server
  def initialize
    @server_config = {
      Port: 3000,
      DocumentRoot: File.expand_path('./public'),
    }
    @server = WEBrick::HTTPServer.new(@server_config)

    @server.mount('/control', ControlServlet)

    trap('INT') { @server.shutdown }
  end

  def run
    Thread.new do
      @server.start
    end
  end
end
