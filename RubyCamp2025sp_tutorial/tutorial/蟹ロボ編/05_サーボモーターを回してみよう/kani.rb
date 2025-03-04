servo = PWM.new(27, timer:2, channel:3, frequency:50) # 周波数は 50 に．timer と channel はオプション

loop do
  servo.pulse_width_us(1000) # 0度に設定
  sleep 1
  servo.pulse_width_us(1500) # 45度に設定
  sleep 1
  servo.pulse_width_us(2000) # 90度に設定
  sleep 1
end
