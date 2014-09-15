class Post < ActiveRecord::Base
  belongs_to :user

  after_initialize :set_default_value

  scope :order_newer, -> { order(:created_at) }

  validates :user_id,
    presence: true,
    numericality: { only_integer: true, greater_than: 0, allow_blank: true }
  validates :body_text,
    presence: true,
    length: { maximum: 255, allow_blank: true } 
  validates :emotion_level,
    presence: true,
    numericality: { only_integer: true, allow_blank: true }

  private
    def set_default_value
      self.emotion_level ||= 0
    end
 end
