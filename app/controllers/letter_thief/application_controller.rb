module LetterThief
  class ApplicationController < ActionController::Base
    content_security_policy do |policy|
      policy.script_src  :self, :unsafe_inline
      policy.style_src   :self, :unsafe_inline, 'cdn.jsdelivr.net'
    end
  end
end
