class Subtype < ActiveRecord::Base
  belongs_to :type
  has_many :results, dependent: :destroy
end