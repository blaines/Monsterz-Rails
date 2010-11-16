class DecisionsController < ApplicationController

  def rest
    @player = Player.find(params[:player_id])
    @character = @player.characters.find(params[:character_id])
    
    if use_turns(1)
    
      puts @player.id
      puts @character.id
    
      max_health = 95+(5*@character.level.to_i)
      gain_health = max_health/2
    
      puts ">> GAIN_HEALTH: #{gain_health}"
    
      if @character.health+gain_health<max_health
        health = gain_health+@character.health
      else
        health = max_health
      end
    
    
      puts ">> HEALTH: #{health}"
    
    
      @character.health = health
      @player.save
      respond_to do |format|
        format.html { render :text => "REST"}
        format.json { render :json => {:response => :ok}.merge({:character => @character.formatted_hash}).to_json }
      end
      
    end
  end
  
  def explore_forests
    # Subtract two turns
    a = rand(10)
    @player = Player.find(params[:player_id])
    @character = @player.characters.find(params[:character_id])
    if use_turns(5)
      case
      when a > 3
        z = "#{a} GOOD"
        @character.experience += @character.level*2*5.5
        @player.adrenaline += @character.level*20*5.5
      else
        @character.health -= @character.health*(0.2+(rand(100)/100)*0.1)
        z = "#{a} BAD"
      end
      levelup?
      @player.save
      respond_to do |format|
        format.html { render :text => z}
        format.json { render :json => {:response => :ok}.merge({:character => @character.formatted_hash}).to_json }
      end
    end
  end
  
  def explore_oceans
    # Subtract three turns
    a = rand(10)
    @player = Player.find(params[:player_id])
    @character = @player.characters.find(params[:character_id])
    if use_turns(10)
      case
      when a > 3
        z = "#{a} GOOD"
        @character.experience += @character.level*2*11.5
        @player.adrenaline += @character.level*20*11.5
      else
        @character.health -= @character.health*(0.2+(rand(100)/100)*0.1)
        z = "#{a} BAD"
      end
      levelup?
      @player.save
      respond_to do |format|
        format.html { render :text => z}
      format.json { render :json => {:response => :ok}.merge({:character => @character.formatted_hash}).to_json }
      end
    end
  end
  
  def explore_mountains
    # Subtract 1 turn
    a = rand(10)
    @player = Player.find(params[:player_id])
    @character = @player.characters.find(params[:character_id])
    if use_turns(1)
      case
      when a > 3
        z = "#{a} GOOD"
        @character.experience += @character.level*2
        @player.adrenaline += @character.level*20
      else
        @character.health -= @character.health*(0.2+(rand(100)/100)*0.1)
        z = "#{a} BAD"
      end
      levelup?
      @player.save
      respond_to do |format|
        format.html { render :text => z}
        format.json { render :json => {:response => :ok}.merge({:character => @character.formatted_hash}).to_json }
      end
    end
  end
  
  def convert_adrenaline
    @player = Player.find(params[:player_id])
    @character = @player.characters.find(params[:character_id])
    
    experience_gap = (@character.next_level_experience)-(@character.experience)
    
    z = "Remaining Experience #{experience_gap}"
    
    @player.adrenaline -= experience_gap
    @character.experience += experience_gap
    levelup?
    @player.save
    respond_to do |format|
      format.html { render :text => z}
      format.json { render :json => {:response => :ok}.merge({:character => @character.formatted_hash}).to_json }
    end
    
  end
  
  def fight
    a = rand(10)
    @player = Player.find(params[:player_id])
    @character = @player.characters.find(params[:character_id])
    case
    when a > 5
      z = "#{a} WIN"
      @character.experience += @character.level*30
      @character.health -= (rand(100)/100)*(@character.health*0.1)
      @player.adrenaline += (@character.level*10)**2
    else
      z = "#{a} LOSE"
      @character.experience += @character.level*10
      @character.health -= @character.health*(0.2+(rand(100)/100)*0.1)
      @player.adrenaline -= @character.level*40
    end
    levelup?
    @player.save
    respond_to do |format|
      format.html { render :text => z}
      format.json { render :json => {:response => :ok}.merge({:character => @character.formatted_hash}).to_json }
    end
  end

  def run
    @player = Player.find(params[:player_id])
    @character = @player.characters.find(params[:character_id])
    @player.adrenaline -= @character.level*10
    @player.save
    respond_to do |format|
      format.html { render :text => z}
      format.json { render :json => {:response => :ok}.merge({:character => @character.formatted_hash}).to_json }
    end
  end
  
  def use_turns(int)
    if @character.turns-int >= 0
      @character.turns -= int
      return true
    else
      # @character.turns = @character.level
      # @player.save
      respond_to do |format|
        format.html { render :text => "NOT ENOUGH TURNS"}
        format.json { render :json => {:response => :not_enough_turns}.merge({:character => @character.formatted_hash}).to_json }
      end
      return false
    end
  end
  
  # mountains
    # outcomes
      # + .3  Stream
      # - .7  Troll
  # forests
    # outcomes
      # + .3  
      # - .7
  # oceans
    # outcomes
      # + 
      # -
  
  # turns = level
  
  def levelup?
    if @character.experience >= @character.level**3
      @character.level += 1
      @character.health = 95+(5*@character.level)
    end
  end
  
end