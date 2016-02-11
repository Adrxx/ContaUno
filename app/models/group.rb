class Group < ActiveRecord::Base
  has_many :homework_uploads, :dependent => :delete_all
  
end
