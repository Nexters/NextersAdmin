class Book < ActiveRecord::Base
  attr_accessible :id, :title, :description, :author
  attr_accessible :img
  has_attached_file :img, :default_url => "/image/default_book.png"
  belongs_to :member
  attr_accessible :member_id

  belongs_to :category
  attr_accessible :category_id

  has_one :reservation
  #belongs_to :member_res, :class_name => 'Member', :primary_key => 'member_res_id',:foreign_key => 'member_res_id'
  #attr_accessible :member_res_id

end
