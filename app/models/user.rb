class User < ApplicationRecord
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :events
  belongs_to :unit
end
