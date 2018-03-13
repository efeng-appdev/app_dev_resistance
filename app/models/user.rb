class User < ApplicationRecord
  # Direct associations

  has_many   :mission_votes,
             :dependent => :destroy

  has_many   :mission_participants,
             :dependent => :destroy

  has_one    :role,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
