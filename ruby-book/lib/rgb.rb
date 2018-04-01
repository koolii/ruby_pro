# rjust()は0埋めすることが出来るutily関数
def to_hex(r, g, b)
  [r, g, b].inject('#') do |hex, n|
    # hexには初期値が'#'となり、ループが進むに連れて、結果が追加されていく事を認識することが大事
    hex + n.to_s(16).rjust(2, '0')
  end
end

def to_ints(hex)
  r = hex[1..2]
  g = hex[3..4]
  b = hex[5..6]
  ints = []
  [r, g, b].map do |n|
    ints << n.hex
  end
  ints
end