#encoding: utf-8
module NapakalakiGame

require_relative 'Prize.rb'
require_relative 'Monster.rb'

class BadConsequence

  @@MAXTREASURES=10
  
  attr_accessor:text, :level,  :nVisibleTreasures, :nHiddenTreasures, :death,
               :specificHiddenTreasures, :specificVisibleTreasures
  
  def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures,
                someSpecificVisibleTreasures, someSpecificHiddenTreasures, death)
      @text=aText
      @level=someLevels
      @nVisibleTreasures=someVisibleTreasures
      @nHiddenTreasures=someHiddenTreasures
      @death=death
      @specificHiddenTreasures=someSpecificHiddenTreasures
      @specificVisibleTreasures=someSpecificVisibleTreasures
  end

  def isEmpty
    empty=false
    if(@nHiddenTreasures == -1)
      if(@specificHiddenTreasures.empty? && @specificVisibleTreasures.empty? && @level==0 && @death==false)
        empty=true
      end
    else
          if(@level==0 && death==false)
            empty=true
          end
    end
    return empty
  end
  
  def substractHiddenTreasure(t)
      if(@nHiddenTreasures == -1 && @nVisibleTreasures == -1)
          unless (@specificHiddenTreasures.empty?)
              @specificHiddenTreasures.delete(t.type)
          end
    end
  end
  
   def substractVisibleTreasure(t)
      if(@nHiddenTreasures == -1 && @nVisibleTreasures == -1)
          unless (@specificVisibleTreasures.empty?)
              @specificVisibleTreasures.delete(t.type)
          end
    end
  end
  
  def adjustToFitTreasureLists(v,h)
      if(@specificVisibleTreasures.empty? && @specificHiddenTreasures.empty?)
          if(v.size > @nVisibleTreasures)
              n_visibles=@nVisibleTreasures
          else
              n_visibles=v.size
          end
          if(h.size > @nHiddenTreasures)
              n_ocultos=@nHiddenTreasures
          else
              n_ocultos=h.size
          end
          mal_rollo=NumericBadConsequence.new(@text, 0, n_visibles, n_ocultos)
      else
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
      end
      return mal_rollo
  end

  def to_s
    "Descripción del mal rollo: #{@text}\nTesoros ocultos específicos: #{@specificHiddenTreasures}\nTesoros visibles específicos: #{@specificVisibleTreasures}"
  end


end
end
