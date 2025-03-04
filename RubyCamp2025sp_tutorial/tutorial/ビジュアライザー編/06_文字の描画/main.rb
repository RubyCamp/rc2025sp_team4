require 'gosu'

require_relative 'kani'

class MainWindow < Gosu::Window
  def initialize
    super 800, 600, false
    self.caption = 'RubyCamp2025SP tutorial'

    @kanis = []
    10.times do
      @kanis << Kani.new(rand(700) + 50, rand(500) + 50, rand(100))
    end

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

window = MainWindow.new
window.show
