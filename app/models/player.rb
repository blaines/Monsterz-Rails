class Player
  include Mongoid::Document
  field :name
  field :adrenaline, :type => Integer
  embeds_many :characters
  
  validates_uniqueness_of :name
  
  before_save :update_character
  
  def formatted_hash
    z = self.serializable_hash
    z["current_epoch"] = Time.now.to_i
    z["characters"] = z["characters"].map do |c|
      c = c.formatted_hash
    end
    z
  end
  
  def update_character
    self.character.issue_turns
  end
end
