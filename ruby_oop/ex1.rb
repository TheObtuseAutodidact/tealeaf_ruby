# oop ex.1

# Modules can store data, attributes, and/or behaviors that can then me mixed in with other classes or instances
module Snippy

  def snipe(blarg)
    puts "#{blarg}"
  end
end

class Snark
  include Snippy

  def initialize(name)
    @name = name
  end

end

snark = Snark.new(snark)
puts snark.to_s
puts snark.snipe("roar")
