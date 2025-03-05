require 'gosu'

require_relative 'kani'

class MainWindow < Gosu::Window
  def initialize
    super 800, 600, false
    self.caption = 'RubyCamp2025SP tutorial'

    @kani = Kani.new(50, 50, 0)
  end

  def update
    @kani.update
  end

  def draw
    @kani.draw
  end
end

window = MainWindow.new
window.show
