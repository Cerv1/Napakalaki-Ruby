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
#      vKind=v.collect{|t| t.type}
#      hKind=h.collect{|t| t.type}
#          
#      [TreasureKind::HELMET, TreasureKind::ARMOR, TreasureKind::ONEHAND, TreasureKind::BOTHHANDS].each do |tkind|
#        if(@specificVisibleTreasures != nil)
#          adVisList=adVisList+[tkind]*[vKind.select{|t| t==tkind}.size, @specificVisibleTreasures.select{|tt| tt==tkind}.size].min
#        end
#        if(@specificHiddenTreasures != nil)
#          adHidList=adHidList+[tkind]*[hKind.select{|t| t==tkind}.size, @specificHiddenTreasures.select{|tt| tt==tkind}.size].min
#        end
#      end
#      mal_rollo = SpecificBadConsequence.new(@text,0,adVisList, adHidList)
#      return mal_rollo
#    end
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
        
        adjustedbc = SpecificBadConsequence.new(@text, 0, adVisList, adHidLst)
        return adjustedbc
  end
  
end

end