# oop ex.1
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
