class Reservation < ActiveRecord::Base
  attr_accessible :due_date
  belongs_to :book
  attr_accessible :book_id
  belongs_to :member
  attr_accessible :member_id
end
