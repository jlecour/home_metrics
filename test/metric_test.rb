require_relative '../home_metrics'
require 'test/unit'

class TestMetric < Test::Unit::TestCase

  def setup
    @params = {
      :timestamp  => Time.now.strftime('%Y-%m-%dT%H:%M:%S'),
      :kind  => "kind",
      :value => 1
    }

    @metric = Metric.new(@params)
  end

end