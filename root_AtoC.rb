# \servo = PWM.new(27, timer:2, channel:3, frequency:50) # 周波数は 50 に．timer と channel はオプション

# 右モーター初期化（引数のGPIO番号は全ての蟹ロボで共通）
rm_pin1 = PWM.new(25) # 右モーターPIN1
rm_pin2 = PWM.new(26) # 右モーターPIN2

# 左モーター初期化（引数のGPIO番号は全ての蟹ロボで共通）
lm_pin1 = PWM.new(32) # 左モーターPIN1
lm_pin2 = PWM.new(33) # 左モーターPIN2

param = [
  #左の前に進む, 左の後ろに進む, 右の前に進む, 右の後ろに進む, 秒数
  [30, 00, 30, 00, 1.25],

  [100, 100, 100, 100, 1.0],

  [00, 30, 30, 00, 1.4],

  [100, 100, 100, 100, 1.0],

  [30, 00, 30, 00, 6.5],

  [100, 100, 100, 100, 1.0],

  [30, 00, 30, 00, 1.4],

  [100, 100, 100, 100, 1.0],

  #ゴール用
  [70, 00, 70, 00, 2.5],

  [100, 100, 100, 100, 1.0]
]

param.each do |param|
  lm_pin1.duty(param[0])
  lm_pin2.duty(param[1])
  rm_pin1.duty(param[2])
  rm_pin2.duty(param[3])
  sleep param[4]
end


# servo.pulse_width_us(1000) # 0度に設定
# sleep 1
# servo.pulse_width_us(1500) # 45度に設定
# sleep 1
# servo.pulse_width_us(2000) # 90度に設定
# sleep 1