class Player
  include Mongoid::Document
  field :name
  field :adrenaline, :type => Integer
  embeds_many :monsters
  
  validates_uniqueness_of :name
  
  before_save :update_monster
  
  def formatted_hash
    z = self.serializable_hash
    z["current_epoch"] = Time.now.to_i
    z["monsters"] = z["monsters"].map do |c|
      c = c.formatted_hash
    end
    z
  end
  
  def update_monster
    # self.monster.issue_turns
  end
end
