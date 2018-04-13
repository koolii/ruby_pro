class Gate
  STATIONS = [:umeda, :juso, :mikuni]
  FARES = [150, 190]

  def initialize(stationName)
    @name = stationName
  end

  def enter(ticket)
    ticket.stamp(@name)
  end

  def exit(ticket)
    fare = calc_fare(ticket)
    fare <= ticket.fare
  end

  def calc_fare(ticket)
    from = STATIONS.index(ticket.stamp_at)
    to = STATIONS.index(@name)
    # 減算でインデックスを出す
    distance = to - from
    FARES[distance - 1]
  end
end