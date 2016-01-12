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
          
      vKind=v.collect{|t| t.type}
      hKind=h.collect{|t| t.type}
          
      [TreasureKind::HELMET, TreasureKind::ARMOR, TreasureKind::ONEHAND, TreasureKind::BOTHHANDS].each do |tkind|
        if(@specificVisibleTreasures != nil)
          adVisList=adVisList+[tkind]*[vKind.select{|t| t==tkind}.size, @specificVisibleTreasures.select{|tt| tt==tkind}.size].min
        end
        if(@specificHiddenTreasures != nil)
          adHidList=adHidList+[tkind]*[hKind.select{|t| t==tkind}.size, @specificHiddenTreasures.select{|tt| tt==tkind}.size].min
        end
      end
      mal_rollo = SpecificBadConsequence.new(@text,0,adVisList, adHidList)
      return mal_rollo
    end

  end
  
end