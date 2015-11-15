#encoding: utf-8

module NapakalakiGame

class Prize
  
  attr_reader:treasures, :level
  
  def initialize(treasures, level)
    @treasures = treasures
    @level = level
  end
  
  def to_s
    "Tesoros ganados: #{@treasures} \n Niveles ganados: #{@level}"
  end
    
end
end