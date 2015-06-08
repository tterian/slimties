class User < ActiveRecord::Base

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :omniauthable


  validates :full_name,
            :email, presence: true

#  validates :full_name, length: { in: Const::FULL_NAME_LENGTH_RANGE }
#  validates :email, uniqueness: { case_sensitive: false }
#  validates :email, length: { maximum: Const::MAXIMUM_EMAIL_LENGTH }
#  validates :email, email: true # Using email_validator gem

  has_many :posts, dependent: :destroy

  private

  def permitted_params
    [
      :full_name,
      :email
    ]
  end


end
