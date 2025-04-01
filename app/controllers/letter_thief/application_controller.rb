module LetterThief
  class ApplicationController < ActionController::Base
    content_security_policy do |policy|
      policy.style_src_elem :self, :unsafe_inline
    end
  end
end
