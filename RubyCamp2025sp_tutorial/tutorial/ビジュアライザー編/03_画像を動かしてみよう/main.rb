require 'gosu'

class MainWindow < Gosu::Window
  def initialize
    super 800, 600, false
    self.caption = 'RubyCamp2025SP tutorial'

    @char = Gosu::Image.new("images/kani.png", tileable: false)
    @x = 50
    @y = 50
    @angle = 0
    @speed = 5
  end

  def update
    @angle -= @speed if Gosu.button_down?(Gosu::KB_LEFT)
    @angle += @speed if Gosu.button_down?(Gosu::KB_RIGHT)
    @y -= @speed if Gosu.button_down?(Gosu::KB_UP)
    @y += @speed if Gosu.button_down?(Gosu::KB_DOWN)
  end

  def draw
    @char.draw_rot(@x, @y, 0, @angle)
  end
end

window = MainWindow.new
window.show
