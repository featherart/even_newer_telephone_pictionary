class Player < ActiveRecord::Base
  attr_accessible :email, :name, :phone_number, :storyline_id, 
                  :turn_number
  belongs_to :storyline
  before_save :clean_phone_number
  #has_one :turn_number

  def send_text(text_message)
    account_sid    = ENV["TWILIO_ACCOUNT_SID"]
    auth_token     = ENV["TWILIO_AUTH_TOKEN"]
    client = Twilio::REST::Client.new account_sid, auth_token
    account = client.account
    message = account.sms.messages.create({
      :from => ENV["PHONE"],
      :to => self.phone_number,
      :body => text_message})
    #puts message
  end

  def clean_phone_number
    number = self.phone_number
    if number
      unless number[0..1] == "+1"
        number.gsub!(/[^0-9]/, '')
        self.phone_number = "+1#{number}"
      end
    end
  end



end
