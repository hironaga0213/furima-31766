class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :family_name
    validates :read_first, format: { with: /\A[ァ-ン]+\z/, message: 'Full-width katakana characters' }
    validates :read_family, format: { with: /\A[ァ-ン]+\z/, message: 'Full-width katakana characters' }
    validates :birth
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

  has_many :items
  has_many :purchases

end
