class Author < ActiveRecord::Base
  attr_accessor :name
  has_many :authors
end
