# 右モーター初期化（引数のGPIO番号は全ての蟹ロボで共通）
rm_pin1 = PWM.new(25,timer:0,channel:1) # 右モーターPIN1
rm_pin2 = PWM.new(26,timer:0,channel:2) # 右モーターPIN2

# 左モーター初期化（引数のGPIO番号は全ての蟹ロボで共通）
lm_pin1 = PWM.new(32,timer:1,channel:3) # 左モーターPIN1
lm_pin2 = PWM.new(33,timer:1,channel:4) # 左モーターPIN2

lux_right = ADC.new(35) # 右ライトセンサー初期化（GPIO番号: 35）
lux_left  = ADC.new(2)  # 左ライトセンサー初期化（GPIO番号: 2）

servo1 = PWM.new(27, timer:2, channel:5, frequency:50) # 周波数は 50 に．timer と channel はオプション
servo2 = PWM.new(14, timer:2, channel:6, frequency:50) # 周波数は 50 に．timer と channel はオプション

lm_pin1.duty(100)
lm_pin2.duty(65)
rm_pin1.duty(100)
rm_pin2.duty(62)

sleep 1.5

sleeptime=0
while sleeptime < 1.5
  lm_pin1.duty(100)
  lm_pin2.duty(70)
  rm_pin1.duty(100)
  rm_pin2.duty(67)
  puts "light_left: #{lux_left.read_raw}"

  sleep 1
  lm_pin1.duty(100)
  lm_pin2.duty(100)
  rm_pin1.duty(100)
  rm_pin2.duty(100)

  sleep 1
  if (lux_left.read_raw >= 0 && lux_left.read_raw < 300)
    lm_pin1.duty(100)
    lm_pin2.duty(70)
    rm_pin1.duty(100)
    rm_pin2.duty(100)
    sleep 0.5
  end
  
  sleeptime = sleeptime + 0.5
end

# 右に45度回転
lm_pin1.duty(100)
lm_pin2.duty(70)
rm_pin1.duty(70)
rm_pin2.duty(100)

sleep 0.5

#左右のアームを開く
servo1.pulse_width_us(800) 
servo2.pulse_width_us(2200) 
sleep 1

# 一旦停止
lm_pin1.duty(100)
lm_pin2.duty(100)
rm_pin1.duty(100)
rm_pin2.duty(100)

sleep 2

# 直進
lm_pin1.duty(100)
lm_pin2.duty(70)
rm_pin1.duty(100)
rm_pin2.duty(70)

sleep 2.7

# 一旦停止
lm_pin1.duty(100)
lm_pin2.duty(100)
rm_pin1.duty(100)
rm_pin2.duty(100)

sleep 2

#左右のアームを閉じる
servo1.pulse_width_us(1200) 
servo2.pulse_width_us(1800) 
sleep 1

# 一旦停止
lm_pin1.duty(100)
lm_pin2.duty(100)
rm_pin1.duty(100)
rm_pin2.duty(100)

sleep 2

# Aの方角を向く
lm_pin1.duty(100)
lm_pin2.duty(70)
rm_pin1.duty(70)
rm_pin2.duty(100)

sleep 1.3

# 左右モーター停止
lm_pin1.duty(100)
lm_pin2.duty(100)
rm_pin1.duty(100)
rm_pin2.duty(100)

sleep 3

# 前進
lm_pin1.duty(100)
lm_pin2.duty(60)
rm_pin1.duty(100)
rm_pin2.duty(60)

sleep 3

# 左右モーター停止
lm_pin1.duty(100)
lm_pin2.duty(100)
rm_pin1.duty(100)
rm_pin2.duty(100)

sleep 3

# 右に90度回転
lm_pin1.duty(100)
lm_pin2.duty(75)
rm_pin1.duty(75)
rm_pin2.duty(100)

sleep 2.4

#一時停止
lm_pin1.duty(0)
lm_pin2.duty(0)
rm_pin1.duty(0)
rm_pin2.duty(0)

sleep 2

#左右のアームを開く
servo1.pulse_width_us(800) 
servo2.pulse_width_us(2200) 
sleep 1

#一時停止
lm_pin1.duty(0)
lm_pin2.duty(0)
rm_pin1.duty(0)
rm_pin2.duty(0)

sleep 2

# 前進
lm_pin1.duty(100)
lm_pin2.duty(70)
rm_pin1.duty(100)
rm_pin2.duty(70)

sleep 2.6

#前進
lm_pin1.duty(100)
lm_pin2.duty(70)
rm_pin1.duty(100)
rm_pin2.duty(70)

sleep 1.9 # 秒間待機

#一時停止
lm_pin1.duty(0)
lm_pin2.duty(0)
rm_pin1.duty(0)
rm_pin2.duty(0)

sleep 2

#左右のアームを閉じる
servo1.pulse_width_us(1200) 
servo2.pulse_width_us(1800) 
sleep 1

#一時停止
lm_pin1.duty(0)
lm_pin2.duty(0)
rm_pin1.duty(0)
rm_pin2.duty(0)

sleep 2

# 左に90度回転
lm_pin1.duty(70)
lm_pin2.duty(100)
rm_pin1.duty(100)
rm_pin2.duty(70)

sleep 1.5

#一時停止
lm_pin1.duty(0)
lm_pin2.duty(0)
rm_pin1.duty(0)
rm_pin2.duty(0)

sleep 2

#左右のアームを開く
servo1.pulse_width_us(800) 
servo2.pulse_width_us(2200) 
sleep 1

#一時停止
lm_pin1.duty(0)
lm_pin2.duty(0)
rm_pin1.duty(0)
rm_pin2.duty(0)

sleep 2

params1 = [
    ["motor",100,70,100,70,0.5], # 左モーター出力右モーター出力30, 0.5秒前進
    ["motor",100,65,100,65,0.5], # 左モーター出力右モーター出力30, 0.5秒前進
    ["motor",100,60,100,60,2.0], # 左モーター出力右モーター出力30, 5.7秒前進
    ["motor",50,50,50,50,1], # 3秒モーター停止

    ["motor",100,55,100,60,1.5], # 左モーター出力35, 右モーター右モーター出力30, 4.5秒前進
    ["motor",100,100,100,100,1.0], # 3秒モーター停止
    ["surbo",1200,1800], 
    ["motor",0,0,0,0,1.0], # 2秒モーター停止
    ["motor",100,60,100,60,5.0], # 左モーター出力35, 右モーター右モーター出力30, 4.5秒前進
    ["motor",0,0,0,0,1.0], # 3秒モーター停止

    ["motor",75, 100, 100, 75, 2.5], # 左モーター出力35, 右モーター右モーター出力30, 4.5秒前進
    ["motor",0,0,0,0,2.0], # 2秒モーター停止

    ["surbo",800,2000], 
    ["motor",0,0,0,0,2.0], # 2秒モーター停止

    ["motor",100, 60, 100, 60, 5.0], # 左モーター出力35, 右モーター右モーター出力30, 4.5秒前進
    ["motor",0,0,0,0,3.0], # 3秒モーター停止
    ["surbo",1200,1800]
]

# 繰り返し文
params1.each do |param|
  if param[0] == "motor"
   lm_pin1.duty(param[1]) # 左のモーター、前進
   lm_pin2.duty(param[2]) # 左のモーター、後退
   rm_pin1.duty(param[3]) # 右のモーター、前進
   rm_pin2.duty(param[4]) # 右のモーター、後退

   sleep param[5] # 〇秒間実行
  elsif param[0] == "surbo"
    servo1.pulse_width_us(param[1]) 
    servo2.pulse_width_us(param[2]) 
    sleep 1
  end
end

param = [
  #左の前に進む, 左の後ろに進む, 右の前に進む, 右の後ろに進む, 秒数
  ["motor",100, 70, 100, 70, 1.25],
  ["motor",0, 0, 0, 0, 1.0],
  ["motor",70, 100, 100, 70, 2.0],
  ["motor",0, 0, 0, 0, 1.0],
  ["motor",100, 70, 100, 70, 5.0],
  ["motor",50, 50, 50, 50, 1.0],
  ["motor",100, 70, 100, 70, 5.5],
  ["motor",0, 0, 0, 0, 1.0],
  ["motor",100, 70, 70, 100, 1.9],
  ["surbo",800,2200], 
  ["motor",0,0,0,0,1.0], # 1秒モーター停止


  #ゴール用
  ["motor",70, 00, 70, 00, 3.5],
  ["motor",0, 0, 0, 0, 1.0]
]

param.each do |param|
  if param[0] == "motor"
   lm_pin1.duty(param[1])
   lm_pin2.duty(param[2])
   rm_pin1.duty(param[3])
   rm_pin2.duty(param[4])
   sleep param[5]
  elsif param[0] == "surbo"
    servo1.pulse_width_us(param[1]) 
    servo2.pulse_width_us(param[2]) 
    sleep 1
  end
end