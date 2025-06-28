require 'net/http'

module LetterThief
  class DeliveryMethod
    def initialize(options = {})
    end

    # this is not really true, we don't know if it's the last email, but for the moment this should do.
    def deliver!(mail)
      require "launchy"
      uri = URI(LetterThief::Engine.routes.url_helpers.email_messages_url(Rails.configuration.action_mailer.default_url_options))
      response = Net::HTTP.post_form(uri, email_message: EmailMessage.parse(mail).to_json)
      tempfile = Tempfile.new([Time.current.to_i.to_s, '.html'])
      File.open(tempfile.path, 'r+') do |f|
        f.write response.body.force_encoding(Encoding::UTF_8)
      end
      ::Launchy.open(tempfile.path)
    rescue LoadError
      puts "WARNING: LetterThief requires the 'launchy' gem to open the email in a web browser. Add it to your Gemfile."
    end
  end
end
