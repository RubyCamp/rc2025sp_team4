class Kani
  def initialize(x, y, angle)
    # 画面の右上にカニを配置
    @x = 700 - 30 # 画面の幅が800、画像の幅が50と仮定して右端に配置
    @y = 100        # Y座標を50に設定（画面の上端に近い位置）
    @angle = angle
    @speed = 5
    @img = Gosu::Image.new("images/akani.png", tileable: false)
  end

  def update
    @angle -= @speed if Gosu.button_down?(Gosu::KB_LEFT)
    @angle += @speed if Gosu.button_down?(Gosu::KB_RIGHT)
    @y -= @speed if Gosu.button_down?(Gosu::KB_UP)
    @y += @speed if Gosu.button_down?(Gosu::KB_DOWN)
  end

  
  def draw
    #画像のスケーリングを0.5倍に設定して、カニの大きさを小さくする
    scale_factor = 0.5
    @img.draw_rot(@x, @y, 1, @angle, 0.5, 0.5, scale_factor, scale_factor)
  end
end