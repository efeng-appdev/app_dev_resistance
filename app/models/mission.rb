class Mission < ApplicationRecord
  # Direct associations

  has_many   :mission_votes,
             :dependent => :destroy

  has_many   :mission_participants,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
