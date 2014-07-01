class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates_uniqueness_of :username
   validates_presence_of :username
   validates_presence_of :type

   has_many :expertise
   has_many :skills, :through => :expertise

   has_many :user_languages
   has_many :languages, :through => :user_languages

end
