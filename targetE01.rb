# 右モーター初期化（引数のGPIO番号は全ての蟹ロボで共通）
rm_pin1 = PWM.new(25) # 右モーターPIN1
rm_pin2 = PWM.new(26) # 右モーターPIN2

# 左モーター初期化（引数のGPIO番号は全ての蟹ロボで共通）
lm_pin1 = PWM.new(32) # 左モーターPIN1
lm_pin2 = PWM.new(33) # 左モーターPIN2

lux_right = ADC.new(35) # 右ライトセンサー初期化（GPIO番号: 35）
lux_left  = ADC.new(2)  # 左ライトセンサー初期化（GPIO番号: 2）

lm_pin1.duty(100)
lm_pin2.duty(65)
rm_pin1.duty(100)
rm_pin2.duty(65)

sleep 1.5

sleeptime=0
while sleeptime < 1.5
  lm_pin1.duty(100)
  lm_pin2.duty(70)
  rm_pin1.duty(100)
  rm_pin2.duty(70)
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

sleep 0.7

# 直進
lm_pin1.duty(100)
lm_pin2.duty(70)
rm_pin1.duty(100)
rm_pin2.duty(70)

sleep 2.7

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

# 右に90度回転
lm_pin1.duty(100)
lm_pin2.duty(70)
rm_pin1.duty(70)
rm_pin2.duty(100)

sleep 1.7

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

sleep 1.4 # 秒間待機

# 左に90度回転
lm_pin1.duty(70)
lm_pin2.duty(100)
rm_pin1.duty(100)
rm_pin2.duty(70)

sleep 2.2

#一時停止
lm_pin1.duty(0)
lm_pin2.duty(0)
rm_pin1.duty(0)
rm_pin2.duty(0)

sleep 4.0

params1 = [
    [100,70,100,70,0.5], # 左モーター出力右モーター出力30, 6.5秒前進
    [100,65,100,65,0.5], # 左モーター出力右モーター出力30, 6.5秒前進
    [100,60,100,60,5.7], # 左モーター出力右モーター出力30, 6.5秒前進
    [100,100,100,100,3.0], # 3秒モーター停止

    [100,55,100,60,5.0], # 左モーター出力35, 右モーター右モーター出力30, 4.5秒前進
    [0,0,0,0,3.0], # 3秒モーター停止

    [60, 100, 100, 60, 1.4], # 左モーター出力35, 右モーター右モーター出力30, 4.5秒前進
    [0,0,0,0,3.0], # 3秒モーター停止

    [100, 60, 100, 60, 5.0], # 左モーター出力35, 右モーター右モーター出力30, 4.5秒前進
    [0,0,0,0,3.0] # 3秒モーター停止
]

# 繰り返し文
params1.each do |param|

lm_pin1.duty(param[0]) # 左のモーター、前進
lm_pin2.duty(param[1]) # 左のモーター、後退
rm_pin1.duty(param[2]) # 右のモーター、前進
rm_pin2.duty(param[3]) # 右のモーター、後退

sleep param[4] # 〇秒間実行
end

param = [
  #左の前に進む, 左の後ろに進む, 右の前に進む, 右の後ろに進む, 秒数
  [100, 70, 100, 70, 1.25],

  [0, 0, 0, 0, 1.0],

  [70, 100, 100, 70, 1.4],

  [0, 0, 0, 0, 1.0],

  [100, 70, 100, 70, 6.5],

  [0, 0, 0, 0, 1.0],

  [100, 70, 70, 100, 1.4],

  [0, 0, 0, 0, 1.0],

  #ゴール用
  [70, 00, 70, 00, 2.5],

  [0, 0, 0, 0, 1.0]
]

param.each do |param|
  lm_pin1.duty(param[0])
  lm_pin2.duty(param[1])
  rm_pin1.duty(param[2])
  rm_pin2.duty(param[3])
  sleep param[4]
end