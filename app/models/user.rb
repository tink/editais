class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :registerable, :recoverable, :rememberable, 
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable, :validatable

  belongs_to :instituicao
  attr_accessible :email, :password, :password_confirmation, :remember_me

  validates_presence_of :instituicao_id
end
