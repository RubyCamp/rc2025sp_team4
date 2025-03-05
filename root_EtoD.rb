# 右モーター初期化（引数のGPIO番号は全ての蟹ロボで共通）
rm_pin1 = PWM.new(25) # 右モーターPIN1
rm_pin2 = PWM.new(26) # 右モーターPIN2

# 左モーター初期化（引数のGPIO番号は全ての蟹ロボで共通）
lm_pin1 = PWM.new(32) # 左モーターPIN1
lm_pin2 = PWM.new(33) # 左モーターPIN2

# 前進
lm_pin1.duty(30)
lm_pin2.duty(00)
rm_pin1.duty(30)
rm_pin2.duty(00)

sleep 2.8 # 3.5秒間待機

# 右に90度回転
lm_pin1.duty(30)
lm_pin2.duty(00)
rm_pin1.duty(00)
rm_pin2.duty(30)

sleep 1.3

# 前進
lm_pin1.duty(30)
lm_pin2.duty(00)
rm_pin1.duty(30)
rm_pin2.duty(00)

sleep 2.5 # 秒間待機

#一時停止
lm_pin1.duty(100)
lm_pin2.duty(100)
rm_pin1.duty(100)
rm_pin2.duty(100)

sleep 4.0

#前進
lm_pin1.duty(30)
lm_pin2.duty(00)
rm_pin1.duty(30)
rm_pin2.duty(00)

sleep 1.4 # 秒間待機

# 左に90度回転
lm_pin1.duty(00)
lm_pin2.duty(30)
rm_pin1.duty(30)
rm_pin2.duty(00)

sleep 1.3

#一時停止
lm_pin1.duty(100)
lm_pin2.duty(100)
rm_pin1.duty(100)
rm_pin2.duty(100)

sleep 4.0


