#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module NapakalakiGame

require_relative 'Prize.rb'
require_relative 'Monster.rb'

class BadConsequence
    
  private_class_method:new
  
  @@MAXTREASURES=10
  
  attr_accessor:text, :level,  :nVisibleTreasures, :nHiddenTreasures, :death,
               :specificHiddenTreasures, :specificVisibleTreasures
  
  def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures,
                someSpecificVisibleTreasures, someSpecificHiddenTreasures, death)
      @text=aText
      @level=someLevels
      @nVisibleTreasures=someVisibleTreasures
      @nHiddenTreasures=someHiddenTreasures
      @death=death
      @specificHiddenTreasures=someSpecificHiddenTreasures
      @specificVisibleTreasures=someSpecificVisibleTreasures
  end
  
  def isEmpty
    if(@nHiddenTreasures == -1 && @nHiddenTreasures == -1)
      if(@specificHiddenTreasures.empty? && @specificVisibleTreasures.empty? && @level==0 && @death==false)
        return true
      end
      else if(@nHiddenTreasures==0 && @nVisibleTreasures == 0 && @level==0 && @death == false )
          return true
      end
    end
    return false
  end
  
  def BadConsequence.newLevelNumberOfTreasures(aText, someLevels, someVisibleTreasures, someHiddenTreasures)
    new(aText, someLevels, someVisibleTreasures , someHiddenTreasures, Array.new, Array.new, false)
  end
  
  def BadConsequence.newLevelSpecificTreasures(aText, someLevels, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
    new(aText, someLevels, -1, -1,someSpecificHiddenTreasures, someSpecificVisibleTreasures, false)
  end
  
  def BadConsequence.newDeath(aText)
    new(aText, 0, -1, -1, Array.new, Array.new , true)
  end
  
  def to_s
    "Descripción del mal rollo: #{@text} \n Niveles perdidos: #{@level} \n Número de tesoros visibles: #{@nVisibleTreasures}
     \n Número de tesoros ocultos: #{@nHiddenTreasures} \n Muerte:  #{@death} \n Tesoros ocultos específicos: #{@specificHiddenTreasures} 
     \n Tesoros visibles específicos: #{@specificVisibleTreasures}"
  end
    
end
end