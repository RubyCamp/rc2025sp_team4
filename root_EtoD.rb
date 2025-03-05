# 右モーター初期化（引数のGPIO番号は全ての蟹ロボで共通）
rm_pin1 = PWM.new(25) # 右モーターPIN1
rm_pin2 = PWM.new(26) # 右モーターPIN2

# 左モーター初期化（引数のGPIO番号は全ての蟹ロボで共通）
lm_pin1 = PWM.new(32) # 左モーターPIN1
lm_pin2 = PWM.new(33) # 左モーターPIN2

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

sleep 2.5 # 秒間待機

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

sleep 1.7

#一時停止
lm_pin1.duty(0)
lm_pin2.duty(0)
rm_pin1.duty(0)
rm_pin2.duty(0)

sleep 4.0


