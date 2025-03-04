# i2c = I2C.new()
# vl53l0x = VL53L0X.new(i2c)
# vl53l0x.set_timeout(500) # タイムアウト

# if !vl53l0x.init
#   puts "Failed to detect and initialize sensor!"
# else
#   vl53l0x.start_continuous(100) # 100 ms 間隔で計測. タイムアウトより小さい値にしておく．
#   loop do
#     puts vl53l0x.read_range_continuous_millimeters
#     puts " TIMEOUT" if vl53l0x.timeout_occurred
#   end
# end

servo = PWM.new(27, timer:2, channel:3, frequency:50)  # 周波数は 50 に．timer と channel はオプション
loop do
  servo.pulse_width_us( 1000 )
  sleep 1
  servo.pulse_width_us( 1500 )
  sleep 1
  servo.pulse_width_us( 2000 )
end