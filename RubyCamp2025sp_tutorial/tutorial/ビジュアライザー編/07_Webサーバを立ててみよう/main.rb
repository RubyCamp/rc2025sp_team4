require 'gosu'

require_relative 'kani'
require_relative 'server'

class MainWindow < Gosu::Window
  def initialize
    super 800, 600, false
    self.caption = 'RubyCamp2025SP tutorial'

    @kanis = []
    @kanis << Kani.new(150, 150, 0)

    @font = Gosu::Font.new(32, name: "DelaGothicOne-Regular.ttf")
  end

  def update
    @kanis.each do |kani|
      kani.update
    end
  end

  def draw
    @kanis.each do |kani|
      kani.draw
    end

    @font.draw_text(Time.now.to_s, 10, 10, 0, 1.0, 1.0, 0xff_ff0000)
  end
end

Server.new.run

window = MainWindow.new
window.show
