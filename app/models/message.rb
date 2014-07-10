class Message < ActiveRecord::Base
  
  has_many :replies, :class_name => "Message"
  belongs_to :original_message, :class_name => "Message", :foreign_key => :message_id
  belongs_to :sender, :class_name => "User", :foreign_key => :sender_id
  belongs_to :receiver, :class_name => "User", :foreign_key => :recipient_id

  validates :sender_id, :presence => true
  validates :recipient_id, :presence => true
  validates :body, :presence => true

end
