class User < ActiveRecord::Base
  
    
    validates :email, :presence => true,
    :confirmation =>true
     validates :password, :presence => true,
       :confirmation =>true
      validates :password_confirmation, :presence => true,
        :confirmation =>true
        
        
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # attr_accessible :title, :body
 

  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :bookings
  has_many :lesson_registrations
  
   def self.current
    Thread.current[:user]
  end
  def self.current=(user)
    Thread.current[:user] = user
  end

end
