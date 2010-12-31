class DecisionsController < ApplicationController
    
  def rest
    @player = Player.find(params[:player_id])
    @monster = @player.monsters.find(params[:monster_id])
    
    if use_turns(1)
    
      puts @player.id
      puts @monster.id
    
      max_health = 95+(5*@monster.level.to_i)
      gain_health = max_health/2
    
      puts ">> GAIN_HEALTH: #{gain_health}"
    
      if @monster.health+gain_health<max_health
        health = gain_health+@monster.health
      else
        health = max_health
      end
    
    
      puts ">> HEALTH: #{health}"
    
    
      @monster.health = health
      @player.save
      respond_to do |format|
        format.html { render :text => "REST"}
        format.json { render :json => {:response => :ok}.merge({:monster => @monster.formatted_hash}).to_json }
      end
      
    end
  end
  
  def explore_forests
    # Subtract two turns
    a = rand(10)
    @player = Player.find(params[:player_id])
    @monster = @player.monsters.find(params[:monster_id])
    if use_turns(5)
      case
      when a > 3
        z = "#{a} GOOD"
        @monster.experience += @monster.level*2*5.5
        @player.adrenaline += @monster.level*20*5.5
      else
        @monster.health -= @monster.health*(0.2+(rand(100)/100)*0.1)
        z = "#{a} BAD"
      end
      levelup?
      @player.save
      respond_to do |format|
        format.html { render :text => z}
        format.json { render :json => {:response => :ok}.merge({:monster => @monster.formatted_hash}).to_json }
      end
    end
  end
  
  def explore_oceans
    # Subtract three turns
    a = rand(10)
    @player = Player.find(params[:player_id])
    @monster = @player.monsters.find(params[:monster_id])
    if use_turns(10)
      case
      when a > 3
        z = "#{a} GOOD"
        @monster.experience += @monster.level*2*11.5
        @player.adrenaline += @monster.level*20*11.5
      else
        @monster.health -= @monster.health*(0.2+(rand(100)/100)*0.1)
        z = "#{a} BAD"
      end
      levelup?
      @player.save
      respond_to do |format|
        format.html { render :text => z}
      format.json { render :json => {:response => :ok}.merge({:monster => @monster.formatted_hash}).to_json }
      end
    end
  end
  
  def explore_mountains
    # Subtract 1 turn
    a = rand(10)
    @player = Player.find(params[:player_id])
    @monster = @player.monsters.find(params[:monster_id])
    if use_turns(1)
      case
      when a > 3
        z = "#{a} GOOD"
        @monster.experience += @monster.level*2
        @player.adrenaline += @monster.level*20
      else
        @monster.health -= @monster.health*(0.2+(rand(100)/100)*0.1)
        z = "#{a} BAD"
      end
      levelup?
      @player.save
      respond_to do |format|
        format.html { render :text => z}
        format.json { render :json => {:response => :ok}.merge({:monster => @monster.formatted_hash}).to_json }
      end
    end
  end
  
  def convert_adrenaline
    @player = Player.find(params[:player_id])
    @monster = @player.monsters.find(params[:monster_id])
    
    experience_gap = (@monster.next_level_experience)-(@monster.experience)
    
    z = "Remaining Experience #{experience_gap}"
    
    @player.adrenaline -= experience_gap
    
    if @player.adrenaline > 0
      @monster.experience += experience_gap
      levelup?
      @player.save
      respond_to do |format|
        format.html { render :text => z}
        format.json { render :json => {:response => :ok}.merge({:monster => @monster.formatted_hash}).to_json }
      end
    else
      respond_to do |format|
        format.html { render :text => "Not enough adrenaline"}
        format.json { render :json => {:response => :fail, :message => "Not enough adrenaline"}.merge({:monster => @monster.formatted_hash}).to_json }
      end
    end    
  end
  
  def fight
    a = rand(10)
    @player = Player.find(params[:player_id])
    @monster = @player.monsters.find(params[:monster_id])
    case
    when a > 5
      z = "#{a} WIN"
      @monster.experience += @monster.level*30
      @monster.health -= (rand(100)/100)*(@monster.health*0.1)
      @player.adrenaline += (@monster.level*10)**2
    else
      z = "#{a} LOSE"
      @monster.experience += @monster.level*10
      @monster.health -= @monster.health*(0.2+(rand(100)/100)*0.1)
      @player.adrenaline -= @monster.level*40
    end
    levelup?
    @player.save
    respond_to do |format|
      format.html { render :text => z}
      format.json { render :json => {:response => :ok}.merge({:monster => @monster.formatted_hash}).to_json }
    end
  end

  def run
    @player = Player.find(params[:player_id])
    @monster = @player.monsters.find(params[:monster_id])
    @player.adrenaline -= @monster.level*10
    @player.save
    respond_to do |format|
      format.html { render :text => z}
      format.json { render :json => {:response => :ok}.merge({:monster => @monster.formatted_hash}).to_json }
    end
  end
  
  def use_turns(int)
    @monster.issue_turns
    if @monster.turns-int >= 0
      @monster.turns -= int
      return true
    else
      # @monster.turns = @monster.level
      # @player.save
      respond_to do |format|
        format.html { render :text => "NOT ENOUGH TURNS"}
        format.json { render :json => {:response => :not_enough_turns}.merge({:monster => @monster.formatted_hash}).to_json }
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
    if @monster.experience >= @monster.level**3
      @monster.level += 1
      @monster.health = 95+(5*@monster.level)
    end
  end
  
end