class User < ActiveRecord::Base
    belongs_to :role
  end
  class Role < ActiveRecord::Base
    has_many :users
  end