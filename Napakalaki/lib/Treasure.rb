#encoding: utf-8

module NapakalakiGame

require_relative 'TreasureKind.rb'

class Treasure
  
  attr_reader:name, :bonus, :type
  
  def initialize(n,bonus,t)
    @name=n
    @bonus=bonus
    @type=t  
  end
  
end
end