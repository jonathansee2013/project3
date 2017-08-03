class Message < ApplicationRecord

  belongs_to :sender, :class_name=>'User', :foreign_key=>'sender_id'
  belongs_to :receiver, :class_name=>'User', :foreign_key=>'receiver_id'

  validates :content, length: { maximum: 400 }
  # def display_day_published
  #
  #   "Sent on #{created_at.strftime('%-d %-b %Y at %H:%M:%S')}"
  #
  # end

end
