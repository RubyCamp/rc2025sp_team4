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

sleep 0.9

# 左右モーター停止
lm_pin1.duty(100)
lm_pin2.duty(100)
rm_pin1.duty(100)
rm_pin2.duty(100)

sleep 3