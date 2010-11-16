class String
  def possessive
    self + case self[-1,1]#1.8.7 style
    when 's' then "'"
    else "'s"
    end
  end
end