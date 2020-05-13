class Review < ApplicationRecord
  belongs_to :shelter
<<<<<<< HEAD
  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :rating
=======

  validates_presence_of :title,
                        :rating,
                        :content
  # validates_presence_of :picture, optional: true
>>>>>>> master
end
