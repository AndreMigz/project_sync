class Project < ApplicationRecord
  has_one_attached :logo

  DEFAULT_LOGO_URL = "https://placehold.jp/80x80.png".freeze
end
