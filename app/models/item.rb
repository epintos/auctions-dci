class Item < ActiveRecord::Base

  belongs_to :auction

  validates :name, presence: true

end
