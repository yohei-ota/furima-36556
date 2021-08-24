class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: "には半角英数字で入力してください"
  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  validates_format_of :first_name, :last_name, with: NAME_REGEX, message: "には漢字・ひらがな・カタカナを入力してください"
  NAME_KANA_REGEX = /\A[ァ-ヶー]+\z/.freeze
  validates_format_of :first_name_kana, :last_name_kana, with: NAME_KANA_REGEX, message: "にはカタカナを入力してください"

  has_many :items
  has_many :bought_logs
end
