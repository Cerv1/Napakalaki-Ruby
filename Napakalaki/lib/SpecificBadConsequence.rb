#

module NapakalakiGame
  
  class SpecificBadConsequence < BadConsequence
    
    attr_accessor :specificHiddenTreasures, :specificVisibleTreasures
    
    def initialize(aText, someLevels, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
      super(aText, someLevels)
      @specificVisibleTreasures=someSpecificVisibleTreasures
      @specificHiddenTreasures=someSpecificHiddenTreasures
    end
    
    def isEmpty
      return (@specificHiddenTreasures.empty? && @specificVisibleTreasures.empty? )
    end

    def substractHiddenTreasure(t)
        unless (@specificHiddenTreasures.empty?)
          @specificHiddenTreasures.delete(t)
        end
    end

    def substractVisibleTreasure(t)
        unless (@specificVisibleTreasures.empty?)
          @specificVisibleTreasures.delete(t)
        end
    end
    
    def adjustToFitTreasureLists(v,h)         

        if(@specificHiddenTreasures != nil)
            adHidList = Array.new
        else
            adHidList = nil
        end
        
         if(@specificVisibleTreasures != nil)
            adVisList = Array.new
        else
            adVisList = nil
        end
        
        types = [TreasureKind::HELMET, TreasureKind::ARMOR, TreasureKind::ONEHAND, TreasureKind::BOTHHANDS]
        
        for i in 0..@specificHiddenTreasures.size-1
        types.each do |tesoro|
            if(tesoro == v[i])
                adHidList<<tesoro
            end
        end
        end
        
        for i in 0..@specificVisibleTreasures.size-1
        types.each do |tesoro|
            if(tesoro == h[i])
                adVisList<<tesoro
            end
        end
        end
        
        adjustedbc = SpecificBadConsequence.new(@text, 0, adVisList, adHidList)
        return adjustedbc
  end
  
end

end