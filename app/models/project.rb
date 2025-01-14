class Project < ApplicationRecord
  belongs_to :user
  has_one_attached :logo
  has_many :tasks, dependent: :destroy

  DEFAULT_LOGO_URL = "https://placehold.jp/80x80.png".freeze
end
