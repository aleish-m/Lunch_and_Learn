class Sight
  attr_reader :name, :address, :place_id

  def initialize(sight_data)
    @name = sight_data[:name]
    @address = sight_data[:formatted]
    @place_id = sight_data[:place_id]
  end
end