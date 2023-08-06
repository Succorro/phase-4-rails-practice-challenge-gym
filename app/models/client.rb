class Client < ApplicationRecord
    has_many :memberships
    has_many :gyms, through: :memberships

    validates :name, presence: true
    validates :age, presence: true 

    def client_total 
        self.memberships.sum {|membership| membership.charge }
    end 
end
