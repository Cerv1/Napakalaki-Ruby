#encoding: utf-8
module NapakalakiGame

require_relative 'Prize.rb'
require_relative 'Monster.rb'

class BadConsequence

  @@MAXTREASURES=10
  
  attr_accessor:text, :level,  :nVisibleTreasures, :nHiddenTreasures, :death,
               :specificHiddenTreasures, :specificVisibleTreasures
  
  def initialize(aText, someLevels)
      @text=aText
      @level=someLevels
  end

  def to_s
    "Descripción del mal rollo: #{@text}\nTesoros ocultos específicos: #{@specificHiddenTreasures}\nTesoros visibles específicos: #{@specificVisibleTreasures}"
  end


end
end
