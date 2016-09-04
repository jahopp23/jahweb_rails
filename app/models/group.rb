class Group < ApplicationRecord
  belongs_to :user
  has_many :members, dependent: :destroy
  has_many :members_joined, through: :members, source: :user

  validates :name, :description, presence: true
  validates :name, length: { minimum: 6 }, allow_nil: true
  validates :description, length: {minimum: 10}, allow_nil: true
end
