#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
recquire 'TreasureKind.rb'
class Treasure
  
  attr_reader:name, :gold, :bonus, :type
  
  def initialize(n,g,bonus,t)
    @name=n
    @gold=g
    @bonus=bonus
    @type=t  
  end
  

 
end
