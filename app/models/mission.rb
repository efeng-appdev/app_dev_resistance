class Mission < ApplicationRecord
  # Direct associations

  has_many   :mission_votes,
             :dependent => :destroy

  has_many   :mission_participants,
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :mission_participants,
             :source => :user

  # Validations

end
