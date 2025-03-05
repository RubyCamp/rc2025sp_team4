require 'gosu'

class MainWindow < Gosu::Window
  def initialize
    super 800, 600, false
    self.caption = 'RubyCamp2025SP tutorial'
  end
end

window = MainWindow.new
window.show
