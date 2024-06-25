class Component < ApplicationRecord
  belongs_to :survey
  validates :component_type, presence: true
end
