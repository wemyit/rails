class Type < ActiveRecord::Base
  has_many :subtypes, dependent: :destroy

  attr_accessor :subtypes
  accepts_nested_attributes_for :subtypes
end