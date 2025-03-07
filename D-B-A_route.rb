#右モーター初期化（引数のGPIO番号は全ての蟹ロボで共通）
rm_pin1 = PWM.new(25) # 右モーターPIN1
rm_pin2 = PWM.new(26) # 右モーターPIN2

#左モーター初期化（引数のGPIO番号は全ての蟹ロボで共通）
lm_pin1 = PWM.new(32) # 左モーターPIN1
lm_pin2 = PWM.new(33) # 左モーターPIN2

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