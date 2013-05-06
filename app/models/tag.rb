class Tag < ActiveRecord::Base
  has_and_belongs_to_many :pints
end
