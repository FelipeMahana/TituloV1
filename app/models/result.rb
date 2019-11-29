class Result < ApplicationRecord
  belongs_to :user

  #probando validacion
  #validates_numericality_of :hundred_mts, greater_than_or_equal_to: 9.5, message: 'hola'
  #validate :greater_than_or_equal_to

  #def greater_than_or_equal_to
  #  errors.add(:hundred_mts, 'ola')
  #end
end
