require 'gosu'

class MainWindow < Gosu::Window
  def initialize
    super 800, 600, false
    self.caption = 'RubyCamp2025SP tutorial'

    @char = Gosu::Image.new("images/kani.png", tileable: false)
  end

  def draw
    @char.draw(10, 10, 0)
  end
end

window = MainWindow.new
window.show
