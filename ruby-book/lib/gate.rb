class Gate
  def initialize(stationName)
    @name = stationName
  end

  def enter(ticket)
  end

  def exit(ticket)
    true
  end
end