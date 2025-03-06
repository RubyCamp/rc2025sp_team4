require 'gosu'

class Gameover
  def initialize(window)
    @time = 12  # カウントダウンの初期値
    @font = Gosu::Font.new(window, Gosu.default_font_name, 50)  # フォントを初期化
    @last_time_update = Time.now  # 時間管理
  end

  def update
    if Time.now - @last_time_update >= 1 && @time > 0
      @time -= 1
      @last_time_update = Time.now
    end
  end

  def draw
    #@font.draw_text(@time, 50, 50, 0, 3.0, 3.0, 0xff_005AFF)  # 時間を描画

    if @time <= 0
       # 1行目: GAME
       @font.draw_text("GAME", 50, 40, 2, 5.0, 5.0, 0xff_03AF7A)
       # 2行目: OVER
       @font.draw_text("OVER", 50, 300, 0, 5.0, 5.0, 0xff_03AF7A)
    elsif @time <= 10
      @font.draw_text(@time, 50, 50, 0, 3.0, 3.0, 0xff_FF4B00) 
    else 
      @font.draw_text(@time, 50, 50, 0, 3.0, 3.0, 0xff_005AFF) 
    end
  end
end
