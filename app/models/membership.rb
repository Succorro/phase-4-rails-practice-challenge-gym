class Membership < ApplicationRecord
    belongs_to :gym
    belongs_to :client

    validates :gym_id, uniqueness: {scope: :client_id, message: "This client already has a membership at this gym!"}
    validates :gym_id, presence: true 
    validates :client_id, presence: true
    validates :charge, presence: true
end
