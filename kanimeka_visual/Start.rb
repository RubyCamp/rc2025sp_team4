require 'gosu'

class Start
  attr_accessor :game_started

def initialize(window)

  # カウントダウン用の変数
  @font = Gosu::Font.new(window, Gosu.default_font_name, 50)  # フォントを初期化
  @game_started = false  # ゲーム開始フラグ
  @start_time = Gosu.milliseconds  # ゲーム開始前の時間を記録（現在のミリ秒）
end

def update
  if !@game_started && Gosu.milliseconds - @start_time >= 1500
    # ゲーム開始前3秒経過したらゲームを開始
    @game_started = true
  end

  # ゲームが開始されたら、ゲームのロジックを進める
  if @game_started
    # ここにゲームの進行ロジックを追加（例: カニの動きやボールシュートなど）
  end
end

def draw
  if @game_started
    # ゲームが開始されたらカウントダウン開始(ゲームが開始されたら、)
    
  else
    # ゲームが開始されていない場合（スタート画面）
    @font.draw_text("START !", 100, 300, 0, 3.5, 3.5, 0xff_03AF7A)
  end
end
end

  