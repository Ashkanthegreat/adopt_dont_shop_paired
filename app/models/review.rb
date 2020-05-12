class Review < ApplicationRecord
  belongs_to :shelter

  validates_presence_of :title,
                        :rating,
                        :content
  # validates_presence_of :picture, optional: true
end
