module LetterThief
  class ApplicationController < ActionController::Base
    content_security_policy do |policy|
      policy.style_src :self, :unsafe_inline, 'cdn.jsdelivr.net'
    end
  end
end
