class Player
  include Mongoid::Document
  field :name
  field :adrenaline, :type => Integer
  embeds_many :characters
  
  validates_uniqueness_of :name
  
  def formatted_hash
    z = self.serializable_hash
    z["current_epoch"] = Time.now.to_i
    z
  end
end
