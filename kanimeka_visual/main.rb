require 'gosu'
require File.expand_path('kani.rb','D:\Users\Ruby\rc2025sp_team4\kanimeka_visual')
require File.expand_path('Gameover.rb','D:\Users\Ruby\rc2025sp_team4\kanimeka_visual')
require File.expand_path('Start.rb','D:\Users\Ruby\rc2025sp_team4\kanimeka_visual')
require File.expand_path('background.rb','D:\Users\Ruby\rc2025sp_team4\kanimeka_visual')

class MainWindow < Gosu::Window
  def initialize
    super 800, 600, false #画面の大きさ
    self.caption = 'gayoushi'
    @kani = Kani.new(100, 100, 0) #カニの大きさ管理
    @Gameover = Gameover.new(self)
    @Start = Start.new(self)
    @background = Background.new
  end
  def update
    @kani.update
    @Start.update
    if @Start.game_started
      @Gameover.update
    end 
  end
  def draw
    @kani.draw  # Kani を描画
    @background.draw 
    @Start.draw
    if @Start.game_started
      @Gameover.draw
    end  
  end
end

window = MainWindow.new
window.show