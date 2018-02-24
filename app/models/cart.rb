class Cart

  attr_reader :contents

  def initialize(contents)
    @contents = contents ||= Hash.new(0)
  end

  def cart_accessories
    contents.map { |id, count| Accessory.find(id.to_i) }
  end

  def add_accessory(id)
    if contents[id.to_s] == nil
      contents[id.to_s] = 1
    else
      contents[id.to_s] += 1
    end 
  end

  def lose_accessory(id)
    contents[id.to_s] -= 1
  end

  def remove_accessory(id)
    contents.delete(id)
  end

  def total_count
    contents.values.sum
  end

  def count_of(id)
    contents[id.to_s]
  end

  def subtotal(accessory)
    count_of(accessory.id) * Accessory.find(accessory.id).price
  end

end
