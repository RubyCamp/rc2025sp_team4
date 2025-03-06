require 'gosu'

require File.expand_path('kani.rb','D:\Users\Ruby\rc2025sp_team4\04_クラスの活用1_シンプルな置き換え')

class MainWindow < Gosu::Window
  def initialize
    super 800, 600, false
    self.caption = 'Kanimekakoubou'

    @kani = Kani.new(50, 50, 0)
    @time = 3  # カウントダウンの初期値
    @font = Gosu::Font.new(self, Gosu.default_font_name, 50)  # フォントを初期化
    @last_time_update = Time.now  # 時間管理
  end

  def update
    @kani.update
    if Time.now - @last_time_update >= 1 && @time > 0
      @time -= 1
      @last_time_update = Time.now
    end
  end

  def draw
    @kani.draw  # Kani を描画
    @font.draw_text(@time, 10, 10, 0, 2.0, 2.0, 0xff_005AFF)  # 時間を描画

    if @time <= 0
       # 1行目: GAME
       @font.draw_text("GAME", 50, 40, 0, 5.0, 5.0, 0xff_03AF7A)
       # 2行目: OVER
       @font.draw_text("OVER", 50, 300, 0, 5.0, 5.0, 0xff_03AF7A)
    end
  end
end

window = MainWindow.new
window.show
