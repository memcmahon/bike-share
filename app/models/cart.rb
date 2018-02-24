class Cart

  attr_reader :contents

  def initialize(contents)
    @contents = contents ||= Hash.new(0)
  end

  def add_accessory(id)
    contents[id.to_s] += 1
  end

end
