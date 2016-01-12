#

module NapakalakiGame
  
  class DeathBadConsequence < NumericBadConsequence
    
    attr_accessor :death
    
    def initialize(aText)
      super(aText, 0)
      @death=true
    end
    
    def isEmpty
        return @death
    end
    
  end
  
end