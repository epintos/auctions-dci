class Auction < ActiveRecord::Base

  has_one :item
  belongs_to :winner, class_name: 'User'
  belongs_to :seller, class_name: 'User'
  has_many :bids

  validates :item, presence: true
  validates :seller, presence: true
  validates :end_date, presence: true
  validates :price, numericality: true

  validate :buyer_and_seller_are_different
  validate :end_date_period

  STATUS = [:started, :closed, :cancelled]
  validates :status, inclusion: { in: STATUS }

  accepts_nested_attributes_for :item

  after_initialize :default_attributes

  private

    def end_date_period
      errors.add(:end_date, :end_date_in_future) if end_date.present? && end_date < DateTime.current
    end

    def buyer_and_seller_are_different
      errors.add(:seller, :seller_different_winner) if seller == winner
    end

    def default_attributes
      self.status ||= :started
    end

end
