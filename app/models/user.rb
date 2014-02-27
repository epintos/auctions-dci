class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :account, presence: true

  has_many :auctions, foreign_key: 'seller_id'

  after_initialize :default_attributes

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def default_attributes
    self.account ||= 100
  end

end
