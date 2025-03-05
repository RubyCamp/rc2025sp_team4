# ADC - アナログ・デジタル変換（analog to digital conversion）クラスを用いて左右のライトセンサーの読み取り値を得る。

lux_right = ADC.new(35) # 右ライトセンサー初期化（GPIO番号: 35）
lux_left  = ADC.new(2)  # 左ライトセンサー初期化（GPIO番号: 2）

while true
  # 「read_raw」メソッドでライトセンサーの読み取り値をデジタル化して表示する。
  puts "light_right: #{lux_right.read_raw}, light_left: #{lux_left.read_raw}"
  sleep 1
end
