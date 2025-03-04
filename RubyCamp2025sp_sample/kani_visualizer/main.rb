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
    @background = Gosu::Image.new("images/field.png")
    @kani1 = Kani1.instance
    @kani1.visible = true
    @kani1.set_pos(690, 467)
    @kani1.set_angle(0)
    @ball = Ball.instance
    @ball.visible = false

    @characters = [@kani1, @ball]
  end

  # 1フレーム分の更新処理
  def update
    exit if Gosu.button_down?(Gosu::KB_ESCAPE)
  end

  # 1フレーム分の描画処理
  def draw
    @background.draw(0, 0, 0)
    @characters.each do |character|
      character.draw if character.visible
    end
  end
end

# Webrickサーバ開始
Server.new.run

# メインウィンドウ表示
window = MainWindow.new
window.show
