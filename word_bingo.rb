# 変数名の「_w」はwordの略

# 配列にSの値を入れ、ビンゴカードの単語を挿入（計S*S個分）
S = gets.to_i
  bingo_card = Array.new(S){gets.split}.flatten

# 配列にNの値を入れ、ビンゴカード勝利条件となる単語を挿入
N = gets.to_i
  win_w = Array.new(N){gets.split}.flatten

# S値の単語の中にN値の単語を探し、見つかれば
# S値のインデックスを保持したまま該当単語をwin_w_frame(空の配列)に挿入
  win_w_frame = Array.new(S*S)
  win_w.each do|index|
    if mach_w = bingo_card.find_index(index)
      win_w_frame[mach_w] = bingo_card[mach_w]
    end
  end

# 行と列になるようにS個分、配列を作る
win = win_w_frame.each_slice(S).to_a

# 勝利条件
# 縦の結果
vertical_result = win.transpose.any?{|index|index.all?}
# 横の結果
horizontal_result = win.any?{|index|index.all?}
# 斜めの結果
diagonal_result_1 = Array.new(S){|index| win[index][index] }.all?
diagonal_result_2 = Array.new(S){|index| win[index][-index-1] }.all?

if vertical_result || horizontal_result || diagonal_result_1 || diagonal_result_2
  puts "yes"
else
  puts "no"
end