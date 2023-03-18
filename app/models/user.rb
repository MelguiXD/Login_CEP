# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :vinculos
  devise :database_authenticatable,
         :confirmable, 
         :registerable,
         :recoverable, 
         :rememberable,
         :trackable, 
         :validatable

  include DeviseTokenAuth::Concerns::User

  before_validation :set_uid

  private
  def set_uid
    self[:uid] = self[:email] if self[:uid].blank? && self[:email].present?
  end

end
