#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'Prize.rb'
require 'Monster.rb'

class BadConsequence
    
  private_class_method:new
  
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
