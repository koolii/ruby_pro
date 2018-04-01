# rjust()は0埋めすることが出来るutily関数
def to_hex(r, g, b)
  [r, g, b].inject('#') do |hex, n|
    # hexには初期値が'#'となり、ループが進むに連れて、結果が追加されていく事を認識することが大事
    hex + n.to_s(16).rjust(2, '0')
  end
end

def to_ints(hex)
  r, g, b = hex[1..2], hex[3..4], hex[5..6]
  [r, g, b].map(&:hex)
end