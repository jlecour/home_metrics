class Metric

  attr_reader :timestamp, :kind, :value

  def initialize(timestamp, kind, value)
    @timestamp = if timestamp.is_a?(Fixnum)
      timestamp
    elsif timestamp.is_a?(Time)
      timestamp.to_i
    else
      Time.parse(timestamp).to_i
    end
    @kind  = kind
    @value = value
  end

  def id
    "#{timestamp}.#{kind}"
  end

  def to_hash
    {
      "timestamp" => timestamp,
      "kind"      => kind,
      "value"     => value
    }
  end

end