class Metric

  attr_reader :date, :kind, :value

  def initialize(date, kind, value)
    @date = date
    @kind = kind
    @value = value
  end

  def id
    "#{date.strftime("%Y%m%d")}.#{kind}"
  end

  def to_hash
    {
      "date" => date,
      "kind" => kind,
      "value" => value
    }
  end

end