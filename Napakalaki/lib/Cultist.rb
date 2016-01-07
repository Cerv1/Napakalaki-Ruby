#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'Prize.rb'
require_relative 'Monster.rb'
require_relative 'BadConsequence.rb'
require_relative 'TreasureKind.rb'
require_relative 'Treasure.rb'

module NapakalakiGame

class Cultist
   
    attr_reader :name, :gainedLevels
    
    def initialize(name, gainedLevels)
        @name=name
        @gainedLevels=gainedLevels
    end
    
    def getGainedLevels
        return @gainedLevels
    end
    
end

end
