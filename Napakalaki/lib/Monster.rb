#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module NapakalakiGame

require 'Prize.rb'
require 'BadConsequence.rb'

class Monster
  
  attr_reader :name, :combat_level, :mal_rollo, :treasures
  
  def initialize(name, combat_level, mal_rollo, treasures)
        @name=name
        @combat_level=combat_level
        @mal_rollo=mal_rollo
        @treasures=treasures
  end
  
  def to_s
    "Nombre: #{@name} \n Nivel: #{@combat_level} \n  
    Mal rollo: #{@mal_rollo} \n Niveles ganados: #{@levels}
    \n Tesoros: #{@treasures}" 
  end
  
end

end