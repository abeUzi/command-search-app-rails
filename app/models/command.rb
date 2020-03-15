class Command < ApplicationRecord
  scope :keyword_search, -> w { where('command LIKE ? OR description LIKE ?', "%#{w}%","%#{w}%") }
  has_many :command_options
  belongs_to :command_type
end
