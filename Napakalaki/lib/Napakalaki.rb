# encoding: utf-8

require 'singleton'

module NapakalakiGame

require_relative 'Player.rb'
require_relative 'CardDealer.rb'
require_relative 'CombatResult.rb'
require_relative 'Monster.rb'

class Napakalaki
  
  include Singleton

  attr_reader :currentPlayer, :players, :currentMonster, :dealer, :currentPlayerIndex

  def initialize
    @currentPlayer=nil
    @currentPlayerIndex=0
    @players=Array.new
    @dealer=nil
    @currentMonster=nil
  end

  def developCombat()
      resultado=@currentPlayer.combat(@currentMonster)
      @dealer.giveMonsterBack(@currentMonster)
      return resultado
  end
  
  def discardVisibleTreasures(treasures)
      @treasures.each do
          @currentPlayer.discardVisibleTreasure(treasures)
          dealer.giveTreasureBack(treasures)
      end
  end
  
  def discardHiddenTreasures(treasures)
        treasures.each do
          @currentPlayer.discardHiddenTreasure(treasures)
          @dealer.giveTreasureBack(treasures)
      end
  end
  
  def makeTreasuresVisible(treasures)
      treasures.each do
          @currentPlayer.makeTreasureVisible(treasures)
      end
  end
 
  def initGame(players)
    initPlayers(players)
    setEnemies()
    @dealer.initCards()
    nextTurn()
  end
  
  def nextTurn()
    stateOK=nextTurnIsAllowed()
    if(stateOK)
        @currentMonster = @dealer.nextMonster()
        @currentPlayer=nextPlayer()
        dead=@currentPlayer.isDead()
        if(dead)
            @currentPlayer.initTreasures()
        end
    end
    return stateOK
  end
  
  def endOfGame(result)
    resultado=false
    if(result==CombatResult::WINGAME)
        resultado=true
    end
    return resultado
  end
   
  def initGame(players)
      initPlayers(players)
      setEnemies
      @dealer.initCards
      nextTurn
  end

private
    
  def initPlayers(names)
    names.each do
        @players << Player.new(names)  
    end
  end
  
  def nextPlayer()      
      if(@currentPlayerIndex == @players.size-1)
          @currentPlayerIndex=0
      end
      
    if(@currentPlayer == nil)
        x=1+rand(@players.size-1)
        @currentPlayer=@players[x]
        @currentPlayerIndex=@currentPlayer+1
   
   elsif(@currentPlayerIndex == @players.size-1)
        @currentPlayer=@players[0]
        @currentPlayerIndex=@currentPlayer+1
    else
        @currentPlayer=@players[@currentPlayerIndex+1]
        @currentPlayerIndex=@currentPlayer+1
    end
  end
    
  def nextTurnIsAllowed()
    resultado=false
    if(@currentPlayer.validState() || @currentPlayer == nil)
        resultado=true
    end
    return resultado
  end
  
  def setEnemies()
    distinto=false
    i=0
    @players.each {|player|}
      pos=rand(@players.size)
      if(pos==i)
        while(!distinto)
          pos=rand(@players.size)
          if(pos!=i)
            distinto=true
          end
        end
      end
      @players[i].setEnemy(@players[pos])
      i+=1
    end
  end

end
