class Proposal < ActiveRecord::Base

  belongs_to :creative
  belongs_to :project

end
