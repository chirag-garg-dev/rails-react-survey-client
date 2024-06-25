class Survey < ApplicationRecord
  has_many :components, dependent: :destroy
  validates :name, presence: true
  accepts_nested_attributes_for :components
end
