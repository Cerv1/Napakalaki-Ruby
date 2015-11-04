#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module NapakalakiGame

require 'Prize.rb'
require 'BadConsequence.rb'

class Monster
  attr_reader :name, :combat_level, :reward, :mal_rollo
  
  def initialize(name, combat_level, reward, mal_rollo)
        @name=name
        @combat_level=combat_level
        @reward=reward
        @mal_rollo=mal_rollo
  end
  
  def to_s
    "Nombre: #{@name} \n Nivel: #{@combat_level} \n  #{@reward} \n  #{@mal_rollo}"
  end
  
end
end