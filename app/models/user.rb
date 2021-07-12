class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   belongs_to :role, :optional => true
   attr_accessor :role_id2
  # before_create :set_default_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :friends
         has_one :role
        #  accepts_nested_attributes_for :role
        
         def set_role(ider) 
          self.role ||= Role.find_by_id(ider)
         end

         def with_role()
          # puts "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
          # puts User
          if Role.where(:name => "admin").present?
            puts "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
             puts self.role_id2
           
       
        else 
          puts "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"
        end

            build_role if role.nil?
            self
          #  self.role ||= Role.find_by_name('user')
         end
        #  def set_default_role
        #    self.role ||= Role.find_by_name('user')
        #  end
end
