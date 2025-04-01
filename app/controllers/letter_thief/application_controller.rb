module LetterThief
  class ApplicationController < ActionController::Base
    before_action :turn_off_csp_nonce_generation
    content_security_policy do |policy|
      policy.script_src  :self, :unsafe_inline
      policy.style_src   :self, :unsafe_inline, 'cdn.jsdelivr.net'
    end

    private

    def turn_off_csp_nonce_generation
      request.content_security_policy_nonce_directives = []
    end
  end
end
