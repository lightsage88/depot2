class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  
  has_secure_password
  #this line above creates a form taht prompts you
  #to ender a password and makes you reenter it in a
  #separate field so they can validate that you
  #typed what you thought you typed? That's exactly 
  #what has_secure_password() does. It tells Rails to
  #validate that the two passwords match.
end
