  class Product < ApplicationRecord
    belongs_to :subcategory
    belongs_to :user, foreign_key: 'user_id', class_name: 'User'
    has_many_attached :photos
    has_many :order_items

    validates :name, presence: true
    validates :price, presence: true, numericality: { greater_than: 0 }

  end

