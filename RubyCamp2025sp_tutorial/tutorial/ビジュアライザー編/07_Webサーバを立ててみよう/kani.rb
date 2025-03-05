class Kani
  def initialize(x, y, angle)
    @x = x
    @y = y
    @angle = angle
    @speed = 5
    @img = Gosu::Image.new("images/kani.png", tileable: false)
  end

  def update
    @angle -= @speed if Gosu.button_down?(Gosu::KB_LEFT)
    @angle += @speed if Gosu.button_down?(Gosu::KB_RIGHT)
    @y -= @speed if Gosu.button_down?(Gosu::KB_UP)
    @y += @speed if Gosu.button_down?(Gosu::KB_DOWN)
  end

  def draw
    @img.draw_rot(@x, @y, 0, @angle)
  end
end
