require_relative '../home_metrics'
require 'test/unit'

class TestMetric < Test::Unit::TestCase

  def setup
    @params = {
      :date  => Date.today,
      :kind  => "kind",
      :value => 1
    }

    @metric = Metric.new(@params[:date], @params[:kind], @params[:value])
  end

  def test_initialize

    assert_equal @params[:date], @metric.date
    assert_equal @params[:kind], @metric.kind
    assert_equal @params[:value], @metric.value

  end

  def test_id
    expected = "#{@params[:date].strftime("%Y%m%d")}.#{@params[:kind]}"

    assert_equal expected, @metric.id

  end

  def test_to_hash
    expected = {
      'date'  => @params[:date],
      'kind'  => @params[:kind],
      'value' => @params[:value]
    }

    assert_equal expected, @metric.to_hash
  end

end