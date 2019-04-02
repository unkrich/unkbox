class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :folders
  has_one :home_dir, class_name: "Folder"

  def home
	if self.home_dir == nil
      self.home_dir = self.folders.new(name: "home")
    end
    return self.home_dir
  end
end
