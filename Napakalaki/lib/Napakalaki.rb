# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'singleton'

module NapakalakiGame

require 'Player.rb'
require 'CardDealer.rb'
require 'CombatResult.rb'
require 'Monster.rb'

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