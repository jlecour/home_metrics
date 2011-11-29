class Metric

  attr_reader :date, :kind, :value

  def initialize(date, kind, value)
    @date = date
    @kind = kind
    @value = value
  end

end