class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :cart
  has_many :order_items

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  validates :company_name, presence: true, if: :seller?
  validates :requisites, presence: true, if: :seller?

  enum role: [:buyer, :seller]

  private

  def seller?
    role == 'seller'
  end

end
