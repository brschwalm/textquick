class Contact < ActiveRecord::Base
  attr_accessible :name, :phone, :is_favorite, :user_id

  belongs_to :user
end
