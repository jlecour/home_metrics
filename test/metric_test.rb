require_relative '../home_metrics'
require 'test/unit'

class TestMetric < Test::Unit::TestCase

  def setup
    @params = {
      :timestamp  => Time.now.to_i,
      :kind  => "kind",
      :value => 1
    }

    @metric = Metric.new(@params[:timestamp], @params[:kind], @params[:value])
  end

  def test_initialize

    assert_equal @params[:timestamp], @metric.timestamp
    assert_equal @params[:kind], @metric.kind
    assert_equal @params[:value], @metric.value

  end

  def test_id
    expected = "#{@params[:timestamp]}.#{@params[:kind]}"

    assert_equal expected, @metric.id

  end

  def test_to_hash
    expected = {
      'timestamp' => @params[:timestamp],
      'kind'      => @params[:kind],
      'value'     => @params[:value]
    }

    assert_equal expected, @metric.to_hash
  end

  def test_convert_time_to_integer
    time = Time.now
    @params[:timestamp] = time
    
    assert_equal Time, @params[:timestamp].class
    
    @metric = Metric.new(@params[:timestamp], @params[:kind], @params[:value])
    expected = time.to_i

    assert_equal expected, @metric.timestamp
  end

  def test_convert_string_to_integer
    time = Time.now
    @params[:timestamp] = time.iso8601
    
    assert_equal String, @params[:timestamp].class
    
    @metric = Metric.new(@params[:timestamp], @params[:kind], @params[:value])
    expected = time.to_i
    
    assert_equal expected, @metric.timestamp
  end

  # def test_convert_time_to_date
  #   @params[:date] = Time.now
  # 
  #   @metric = Metric.new(@params[:date], @params[:kind], @params[:value])
  # 
  #   expected = @params[:date].to_date
  # 
  #   assert_equal expected, @metric.date
  # end

end