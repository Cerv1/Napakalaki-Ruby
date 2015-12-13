# encoding: utf-8


module NapakalakiGame

require 'singleton'
require_relative 'Player.rb'
require_relative 'CardDealer.rb'
require_relative 'CombatResult.rb'
require_relative 'Monster.rb'

class Napakalaki
  
  include Singleton

  attr_accessor :currentPlayer, :players, :currentMonster, :dealer, :currentPlayerIndex

  def initialize
    @currentPlayer=nil
    @currentPlayerIndex=0
    @players=Array.new
    @dealer=CardDealer.instance
    @currentMonster=nil
  end

  def developCombat()
      resultado=@currentPlayer.combat(@currentMonster)
      @dealer.giveMonsterBack(@currentMonster)
      return resultado
  end
  
  def discardVisibleTreasures(treasures)
        treasures.each do |tesoro|
          @currentPlayer.discardVisibleTreasure(tesoro)
          @dealer.giveTreasureBack(tesoro)
      end
  end
  
  def discardHiddenTreasures(treasures)
        treasures.each do |tesoro|
          @currentPlayer.discardHiddenTreasure(tesoro)
          @dealer.giveTreasureBack(tesoro)
      end
  end
  
  def makeTreasuresVisible(treasures)
      treasures.each do |tesoro|
          @currentPlayer.makeTreasureVisible(tesoro)
      end
  end
  
  def initGame(players)
      initPlayers(players)
      setEnemies
      @dealer.initCards
      nextTurn
  end
  
  def nextTurn
    stateOK = nextTurnIsAllowed
    if(stateOK)
      @currentMonster=@dealer.nextMonster
      @currentPlayer=nextPlayer
      if(@currentPlayer.isDead)
        @currentPlayer.initTreasures
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
  
   def getCurrentPlayer
       return @currentPlayer
   end
   
   def getCurrentMonster
       return @currentMonster
   end

private
    
  def initPlayers(names)
    names.each do |s|
        @players << Player.new(s)  
    end
  end
  
  def nextPlayer()  
    if(@currentPlayer == nil)
        x=rand(@players.size)
    else
        @currentPlayerIndex=@players.index(@currentPlayer)
        if(@currentPlayerIndex==@players.size-1)
          x=0
        else
          x=@currentPlayerIndex+1
        end
    end
    nextplayer=@players.at(x)
    @currentPlayer=nextplayer
    return @currentPlayer
  end
    
  def nextTurnIsAllowed()
    if(@currentPlayer==nil)
      return true
    else
      return @currentPlayer.validState
    end
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
