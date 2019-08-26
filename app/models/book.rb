class Book < ApplicationRecord
	validates :title, length: { in: 2..200 }
	validates :body, presence: true
	belongs_to :user
end
