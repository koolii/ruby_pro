def convert_length(length, unit_from, unit_to)
  # メートル、フィート、インチの単位
  # 1メートルをインチに治す => 1 / 1.0 * 39.37
  # 1フィートをメートルに治す => 1 / 3.28 * 1.0
  units = { 'm' => 1.0, 'ft' => 3.28, 'in' => 39.37 }
  (length / units[unit_from] * units[unit_to]).round(2)
end