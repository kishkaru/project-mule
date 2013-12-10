require 'sms_rb/lib/sms'
#require Rails.root.join("lib", "assets", "sms-rb", "bin", "sms.rb")
#require File.join('..', '..', 'lib', 'assets', 'sms-rb', 'bin', 'sms.rb')
module SmsHelper

    def send_sms(to, body)
        Rails.logger.info("Sent sms to #{to}")

        @phone = to
        @body = body

        SMS.text @body, :to => @phone
    end
end
