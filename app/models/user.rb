class User < ApplicationRecord

  has_many :sent_messages, :class_name => "Message", :foreign_key => "sender_id"
  has_many :received_messages, :class_name => "Message", :foreign_key => "receiver_id"
  
  has_secure_password

  validates :email, presence: true, uniqueness: true, length: {minimum: 5}
  validates :username, presence: true
  validates :gender, presence: true
  validates :dob, presence: true
  validates :country, presence: true
  validates :interest, presence: true

  # def age
  #   now = Time.now.utc.to_date
  #   now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  # end

end
