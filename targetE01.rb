# 右モーター初期化（引数のGPIO番号は全ての蟹ロボで共通）
rm_pin1 = PWM.new(25) # 右モーターPIN1
rm_pin2 = PWM.new(26) # 右モーターPIN2

# 左モーター初期化（引数のGPIO番号は全ての蟹ロボで共通）
lm_pin1 = PWM.new(32) # 左モーターPIN1
lm_pin2 = PWM.new(33) # 左モーターPIN2

i2c = I2C.new()             # I2Cシリアルインターフェース初期化
vl53l0x = VL53L0X.new(i2c)  # 距離センサー（VL53L0X）
vl53l0x.set_timeout(500)    # タイムアウト値設定（単位: ms）
if !(vl53l0x.init)
  puts "initialize failed"
end

# 左右モーター出力30%正回転
lm_pin1.duty(30)
lm_pin2.duty(00)
rm_pin1.duty(30)
rm_pin2.duty(00)

sleep 5.9 # 5.9秒間待機

# 右に90度回転
lm_pin1.duty(30)
lm_pin2.duty(00)
rm_pin1.duty(00)
rm_pin2.duty(30)

sleep 1.4

# 左右モーター停止
lm_pin1.duty(100)
lm_pin2.duty(100)
rm_pin1.duty(100)
rm_pin2.duty(100)

sleep 3

vl53l0x.start_continuous(100) # 100ms 間隔で計測する（タイムアウトより小さい値にしておくこと）
sleep 0.2
distance = vl53l0x.read_range_continuous_millimeters
puts distance

#分岐条件を入れる
#Eにある場合
if (80 < distance && distance < 250)
    # 左右モーター出力30%正回転
    lm_pin1.duty(30)
    lm_pin2.duty(00)
    rm_pin1.duty(30)
    rm_pin2.duty(00)

    sleep 7 # 7秒間待機 

    #左に90度回転
    lm_pin1.duty(00)
    lm_pin2.duty(30)
    rm_pin1.duty(30)
    rm_pin2.duty(00)

    sleep 1.6

    # 左右モーター出力30%正回転
    lm_pin1.duty(30)
    lm_pin2.duty(00)
    rm_pin1.duty(30)
    rm_pin2.duty(00)

    sleep 8.8 # 8.8秒間待機

    # 停止
    lm_pin1.duty(100)
    lm_pin2.duty(100)
    rm_pin1.duty(100)
    rm_pin2.duty(100)

    sleep 100
end