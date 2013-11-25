class User < LmsDatabase
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :role, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  def is_admin?
  	self.role == 'admin'
  end
end
