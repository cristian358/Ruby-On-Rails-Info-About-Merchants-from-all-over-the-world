class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :role
  before_create :set_default_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :friends

         
         def set_default_role
           self.role ||= Role.find_by_name('user')
         end
end
