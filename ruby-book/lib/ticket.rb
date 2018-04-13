class Ticket
  attr_reader :fare, :stamp_at

  def initialize(fare)
    @fare = fare
  end

  def stamp(name)
    # 入場したGate.nameが入っている
    @stamp_at = name
  end
end