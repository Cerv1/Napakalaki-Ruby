#encoding: utf-8

module NapakalakiGame
  
require_relative 'Treasure.rb'
  
class Prize
  
  attr_reader :treasures, :level
  
  def initialize(treasures, level)
    @treasures = treasures
    @level = level
  end
  
  def getLevel
    return @level
  end
  
  def getTreasures()
    return @treasures
  end

  def to_s
    "Tesoros ganados: #{@treasures} \nNiveles ganados: #{@level}"
  end
    
end
end