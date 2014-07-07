class Proposal < ActiveRecord::Base

  validates_length_of :title, :minimum => 4, :allow_blank => false  
  validates_length_of :description, :minimum => 10, :allow_blank => false 
  validates_length_of :about, :minimum => 10, :allow_blank => false 

  belongs_to :creative
  belongs_to :project

end
