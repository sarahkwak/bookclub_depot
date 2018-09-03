class Project < ApplicationRecord
  validates :name, :description, :duration, :owner, presence: true
end
