class MissionParticipant < ApplicationRecord
  # Direct associations

  belongs_to :mission

  belongs_to :user

  # Indirect associations

  # Validations

end
