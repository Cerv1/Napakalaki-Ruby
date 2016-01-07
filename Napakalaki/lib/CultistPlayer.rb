#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'BadConsequence.rb'
require_relative 'Napakalaki.rb'
require_relative 'CardDealer.rb'
require_relative 'Dice.rb'
require_relative 'Monster.rb'
require_relative 'Prize.rb'    

module NapakalakiGame


class CultistPlayer < Player
    
    @@totalCultistPlayers=0
    attr_reader :myCultistCard
    
    def initialize(p,c)
        super(p)
        @myCultistCard=c
        @@totalCultistPlayers=@@totalCultistPlayers+1
    end
    
    def getTotalCultistPlayers
        return @@totalCultistPlayers
    end
    
    protected 
    
    def getCombatLevel
        combat_level=(self.level+(0.2*self.level))
        combat_level+=c.getGainedLevels*@@totalCultistPlayers
        return combat_level.to_i
    end
    
    def getOponentLevel(m)
        return m.getCombatLevelAgainstCultistPlayer
    end
    
    def shouldConvert
        return false
    end
    
    private
    
    def giveMeATreasure
        number=@visibleTreasures.size
        indice = Rand(number)
        robado=@visibleTreasures.at(indice)
        @visibleTreasures.delete_at(indice)
        return robado
    end
    
    def canYouGiveMeATreasure
        return @visibleTreasures.empty?
    end
end

end