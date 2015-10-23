# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'Prize.rb'
require 'Monster.rb'

class BadConsequence
  
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
  
  #BadConsequence.newLevelNumberOfTreasures(aText, someLevels, someVisibleTreasures, someHiddenTreasures)
  #BadConsequence.newLevelSpecificTreasures(aText, someLevels, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
  #BadConsequence.newDeath(aText)
  
  def to_s
    "Descripción del mal rollo: #{@text} \n Niveles perdidos: #{@level} \n Numero de tesoros visibles #{@nVisibleTreasures}
     \n Numero de tesoros ocultos #{@nHiddenTreasures} \n Mortal: #{@death} \n Tesoros ocultos especificos 
     #{@specificHiddenTreasures} \n Tesoros visibles especificos #{@specificVisibleTreasures}"
  end
    
end
