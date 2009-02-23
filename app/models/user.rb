class User < ActiveRecord::Base  
  has_many :sleeps
  
  validates_uniqueness_of :username
  validates_uniqueness_of :email
  
	validates_presence_of :username
	validates_presence_of :password
	validates_presence_of :email
  validates_presence_of :realname
  
  validate :target_hours_possible?

	private
	def target_hours_possible?
	  if target_hours.to_f < 0
	    errors.add(:target_hours, "You cannot sleep less than zero hours per day.")
    end
    if target_hours.to_f > 24
	    errors.add(:target_hours, "You cannot sleep more than twenty four hours per day.")
    end
  end
end