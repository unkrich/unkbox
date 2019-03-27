class Folder < ApplicationRecord
  belongs_to :user

  belongs_to :parent, 
	  		  optional: true, 
	  		  class_name: 'Folder'

  def self.roots(current_user)
  	Folder.where(parent_id: nil, user: current_user)
  end

  def children
  	Folder.where(parent_id: self.id, user_id: self.user_id)
  end
end
