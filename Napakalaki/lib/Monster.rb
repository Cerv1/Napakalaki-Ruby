#encoding: utf-8

module NapakalakiGame

require_relative 'Prize.rb'
require_relative 'BadConsequence.rb'
require_relative 'Treasure.rb'

class Monster
  
  attr_reader :name, :combat_level, :mal_rollo, :reward
  
  def initialize(name, combat_level, mal_rollo, reward)
        @name=name
        @combat_level=combat_level
        @mal_rollo=mal_rollo
        @reward=reward
  end
  
  def getLevelsGained
    return @reward.level
  end
  
  def getTreasuresGained
    return @reward.treasures
  end
 
  def to_s
    "Nombre: #{@name} --> Nivel: #{@combat_level} \n#{@mal_rollo.to_s} \n#{@reward}" 
  end
  
end
end
