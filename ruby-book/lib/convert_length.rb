UNITS = { m: 1.0, ft: 3.28, in: 39.37 }

# todo キーワード引数の使い方がちょっと理解できていない気がする
# :mをデフォルト値としているだけだった
def convert_length(length, from: :m, to: :m)
  # メートル、フィート、インチの単位
  # 1メートルをインチに治す => 1 / 1.0 * 39.37
  # 1フィートをメートルに治す => 1 / 3.28 * 1.0
  (length / UNITS[from] * UNITS[to]).round(2)
end