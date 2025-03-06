class Background
  def initialize
    @background = Gosu::Image.new("images/rbackground.png", tileable: false)  # 背景画像の読み込み
  end


  def draw
    # 背景を画面全体に描画
    @background.draw(0, 0, 0)
  end
end