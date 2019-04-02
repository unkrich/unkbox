class Folder < ApplicationRecord
  belongs_to :user

  belongs_to :parent, 
	  		  optional: true, 
	  		  class_name: 'Folder'

  has_many_attached :files

  def self.roots(user)
  	Folder.where(parent_id: user.home, user: user).order("name ASC")
  end

  def children
  	Folder.where(parent_id: self.id, user_id: self.user_id).order("name ASC")
  end
end
