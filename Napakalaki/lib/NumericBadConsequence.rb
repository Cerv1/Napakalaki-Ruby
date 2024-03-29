#

module NapakalakiGame
  
  class NumericBadConsequence < BadConsequence
    
    attr_accessor :nHiddenTreasures, :nVisibleTreasures
      
    def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures)
      super(aText, someLevels)
      @nHiddenTreasures=someHiddenTreasures
      @nVisibleTreasures=someVisibleTreasures
    end
    
    def isEmpty
      return (@nHiddenTreasures==0 && @nVisibleTreasures==0)
    end
    
    def adjustToFitTreasureLists(v,h)
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
        mal_rollo=NumericBadConsequence.new(@text, 0, n_visibles, n_ocultos)
        return mal_rollo
    end
    
    def substractHiddenTreasure(t)
      if(@nHiddenTreasures-1 >= 0)
        @nHiddenTreasures = @nHiddenTreasures-1
      end
    end

    def substractVisibleTreasure(t)
      if(@nVisibleTreasures-1 >= 0)
        @nVisibleTreasures = @nVisibleTreasures-1
      end
    end
   
  
  end
end