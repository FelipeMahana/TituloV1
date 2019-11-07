class Contract < ApplicationRecord
  has_many :programs, dependent: :destroy
  belongs_to :user
  belongs_to :plan
  #modelo para combrar
  #belongs_to :billing, optional: true

end
