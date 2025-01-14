class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :projects, dependent: :destroy
  has_many :time_logs
  has_many :tasks

  def fullname
    if firstname.present? || lastname.present?
      "#{firstname} #{lastname}".strip
    else
      email.split("@").first
    end
  end
end
