require 'bcrypt'
class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
	has_secure_password 

	has_attached_file :avatar, :styles => { 
    :medium => "300x300>", 
    :thumb => "100x100>" }, 
    :default_url => "ironcat.png"

  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
