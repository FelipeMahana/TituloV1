class Contract < ApplicationRecord
  has_many :programs, dependent: :destroy
  belongs_to :user
  belongs_to :plan

end
