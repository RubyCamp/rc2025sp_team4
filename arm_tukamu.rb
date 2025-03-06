#定義式の部分を書き換える必要があるため動かす前に前のホワイトボードに従ってください。

#一番上の定義式の部分に書く
servo1 = PWM.new(27, timer:2, channel:5, frequency:50) # 周波数は 50 に．timer と channel はオプション
servo2 = PWM.new(14, timer:2, channel:6, frequency:50) # 周波数は 50 に．timer と channel はオプション

#左右のアームを開く
servo1.pulse_width_us(800) 
servo2.pulse_width_us(2200) 
sleep 1

#左右のアームを閉じる
servo1.pulse_width_us(1200) 
servo2.pulse_width_us(1800) 
sleep 1
