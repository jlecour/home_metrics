require_relative '../home_metrics'
require 'test/unit'

class TestMetric < Test::Unit::TestCase
  
  def test_initialize
    date = Date.today
    kind = "kind"
    value = 1
    
    metric = HomeMetrics::Metric.new(date, kind, value)
    
    assert_equal date, metric.date
    assert_equal kind, metric.kind
    assert_equal value, metric.value
    
  end
  
end