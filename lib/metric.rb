require 'dm-types/epoch_time.rb'

class Metric
  include DataMapper::Resource
  
  property :id, Serial
  property :timestamp, EpochTime
  property :kind, String
  property :value, Float

end