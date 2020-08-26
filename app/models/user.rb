class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :sent_messages, foreign_key: "sender_id", class_name: "PrivateMessage"
  has_and_belongs_to_many :r_messages, source: :recipient, class_name: "PrivateMessage"
end
