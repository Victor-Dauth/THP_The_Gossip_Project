class PrivateMessage < ApplicationRecord
  belongs_to :sender, class_name: "User"
  has_and_belongs_to_many :recipients, source: :r_message, class_name: "User"
end
