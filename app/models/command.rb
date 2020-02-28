class Command < ApplicationRecord
  has_many :command_options
  belongs_to :command_type
end
