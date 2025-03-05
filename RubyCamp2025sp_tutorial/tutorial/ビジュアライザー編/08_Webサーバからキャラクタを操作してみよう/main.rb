require 'gosu'

require_relative 'kani'
require_relative 'server'

class MainWindow < Gosu::Window
  def initialize
    super 800, 600, false
    self.caption = 'RubyCamp2025SP tutorial'

    @kani = Kani.instance
    @kani.x = 150
    @kani.y = 150
    @kani.angle = 0

    @font = Gosu::Font.new(32, name: "DelaGothicOne-Regular.ttf")
  end

  def update
    @kani.update
  end

  def draw
    @kani.draw

    @font.draw_text(Time.now.to_s, 10, 10, 0, 1.0, 1.0, 0xff_ff0000)
  end
end

Server.new.run

window = MainWindow.new
window.show
