#encoding: utf-8

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
    
end

end
