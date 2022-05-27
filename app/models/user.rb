class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は英数字混合で入力してください'

  NAME_REGEX = /\A[ぁ-んァ-ヶー-龥々ー]+\z/.freeze
  validates_format_of :last_name, with: NAME_REGEX, message: 'は全角で入力してください'
  validates_format_of :first_name, with: NAME_REGEX, message: 'は全角で入力してください'

  KANA_REGEX = /\A[ァ-ヶー]+\z/.freeze
  validates_format_of :last_name_kana, with: KANA_REGEX, message: 'は全角カナで入力してください'
  validates_format_of :first_name_kana, with: KANA_REGEX, message: 'は全角カナで入力してください'

  has_many :items
  has_many :orders
end
