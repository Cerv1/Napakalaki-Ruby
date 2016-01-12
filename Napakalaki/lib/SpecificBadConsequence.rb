#

module NapakalakiGame
  
  class SpecificBadConsequence < BadConsequence
    
    def initialize(aText, someLevels, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
      super(aText, someLevels, -1, -1,someSpecificHiddenTreasures, someSpecificVisibleTreasures, false)
    end
    
    def isEmpty
      empty=false
      if(@nHiddenTreasures == -1)
        if(@specificHiddenTreasures.empty? && @specificVisibleTreasures.empty? && @level==0 && @death==false)
          empty=true
        end
      else
        if(@level==0 && @death==false)
          empty=true
        end
      end
      return empty
    end


    def substractHiddenTreasure(t)
      if(@nHiddenTreasures == -1 && @nVisibleTreasures == -1)
        unless (@specificHiddenTreasures.empty?)
          @specificHiddenTreasures.delete(t)
        end
      end
    end

    def substractVisibleTreasure(t)
      if(@nHiddenTreasures == -1 && @nVisibleTreasures == -1)
        unless (@specificVisibleTreasures.empty?)
          @specificVisibleTreasures.delete(t)
        end
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