#encoding: utf-8

module NapakalakiGame
  
require_relative 'Treasure.rb'
  
class Prize
  
  attr_accessor :treasures, :level
  
  def initialize(treasures, level)
    @treasures = treasures
    @level = level
  end

  def to_s
    "Tesoros ganados: #{@treasures} \nNiveles ganados: #{@level}"
  end
    
end
end