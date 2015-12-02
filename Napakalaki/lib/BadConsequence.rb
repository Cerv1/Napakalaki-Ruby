#encoding: utf-8
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
  
  def substractHiddenTreasure(t)7
      if(@nHiddenTreasures == -1 && @nVisibleTreasures == -1)
          for i in 0..@specificHiddenTreasures.size-1
              if(t.type==@specificHiddenTreasures[i])
                  @specificHiddenTreasures.delete_at(i)
              end
          end
      else
          @nHiddenTreasures=@nHiddenTreasures-1
      end
      
  end
  
  def adjustToFitTreasureLists(v,h)
      if(@specificVisibleTreasures.isEmpty? && @specificHiddenTreasures.isEmpty?)
          if(v.size > @nVisibleTreasures)
              n_visibles=@nVisibleTreasures
          else
              n_visibles=v.size
          end
          if(h.size > @nHiddenTreasures)
              n_ocultos=@nHiddenTreasures
          else
              n_ocultos=h.size
          end
          mal_rollo=BadConsequence.new(@text, 0, n_visibles, n_ocultos)
      end

  end
  
  def substractVisibleTreasure(t)
      if(@nHiddenTreasures == -1 && @nVisibleTreasures == -1)
          for i in 0..@specificvisibleTreasures.size-1
              if(t.type==@specificVisibleTreasures[i])
                  @specificVisibleTreasures.delete_at(i)
              end
          end
      else
          @nVisibleTreasures=@nVisibleTreasures-1
      end
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
