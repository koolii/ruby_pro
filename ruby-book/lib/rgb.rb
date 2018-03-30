# rjust()は0埋めすることが出来るutily関数
def to_hex(r, g, b)
  '#' +
  r.to_s(16).rjust(2, '0') +
  g.to_s(16).rjust(2, '0') +
  b.to_s(16).rjust(2, '0')
end
