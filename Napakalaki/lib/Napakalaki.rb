# encoding: utf-8

require 'singleton'

module NapakalakiGame

require_relative 'Player.rb'
require_relative 'CardDealer.rb'
require_relative 'CombatResult.rb'
require_relative 'Monster.rb'

class Napakalaki
  
  include Singleton

  attr_reader :currentPlayer, :players, :currentMonster, :dealer

  def initialize
    
  end

  def developCombat()
    
  end
  
  def discardVisibleTreasures(treasures)
    
  end
  
  def discardHiddenTreasures(treasures)
    
  end
  
  def makeTreasuresVisible(treasures)
    
  end
  
  def initGame(players)
    
  end
  
  def nextTurn()
    
  end
  
  def endOfGame(result)
    
  end
  

private
    
  def initPlayers(names)
    
  end
  
  def nextPlayer()
    
  end
  
  def nextTurnAllowed()
    
  end
  
  def setEnemies()
    
  end
  
end
end
