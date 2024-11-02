class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  def fullname
    if firstname.present? || lastname.present?
      "#{firstname} #{lastname}".strip
    else
      email.split("@").first
    end
  end
end
