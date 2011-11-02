class Member < ActiveRecord::Base
  validates_presence_of :name, :contact_no
end
