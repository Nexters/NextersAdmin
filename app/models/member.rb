class Member < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :role_id
  enumerate :role_id, :with => Role

  has_many :books
  has_many :reservations
  def role
    role_id(:name)
  end
end
