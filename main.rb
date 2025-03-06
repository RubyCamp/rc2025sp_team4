require 'gosu'

require_relative 'server'
require_relative 'characters'

# ゲームのメインウィンドウ（メインループ）用クラス
class MainWindow < Gosu::Window
  # 各種定数定義
  WIDTH = 800
  HEIGHT = 600
  FULL_SCREEN = false

  # コンストラクタ
  def initialize
    super WIDTH, HEIGHT, FULL_SCREEN
    self.caption = 'Kani Visualizer'
    @background = Gosu::Image.new("images/field.png.jpeg")
    @kani1 = Kani1.instance
    @kani1.visible = true
    @kani1.set_pos(730, 90)
    @kani1.set_angle(180)
    @ball = Ball.instance
    @ball.visible = false

    @font = Gosu::Font.new(32, name: "DelaGothicOne-Regular.ttf")

    # @song = Gosu::Song.new("music.wav") # music.wavという音楽ファイルを用意してください
    # @sound = Gosu::Sample.new("sound.wav") # sound.wavというサウンドファイルを用意してください

    @characters = [@kani1, @ball]
  end

  # 1フレーム分の更新処理
  def update
    exit if Gosu.button_down?(Gosu::KB_ESCAPE)
    @angle -= @speed if Gosu.button_down?(Gosu::KB_LEFT)
    @angle += @speed if Gosu.button_down?(Gosu::KB_RIGHT)
    @y -= @speed if Gosu.button_down?(Gosu::KB_UP)
    @y += @speed if Gosu.button_down?(Gosu::KB_DOWN)
    # @song.play if !@song.playing?
  end

  # 1フレーム分の描画処理
  def draw
    @background.draw(0, 0, 0)
    @characters.each do |character|
    character.draw if character.visible
    # draw_text("Ball position: (#{@ball_x}, #{@ball_y})")

    end
  end

#キーを押せば何かできるけど、今回は使わなそう
#   def button_down(id)
#     case id
#     when Gosu::KB_LEFT
#       @kani1.move(-10, 0)
#     end
#   end

end

# Webrickサーバ開始
Server.new.run

# メインウィンドウ表示
window = MainWindow.new
window.show


