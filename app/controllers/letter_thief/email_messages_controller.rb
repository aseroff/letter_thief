# frozen_string_literal: true

module LetterThief
  class EmailMessagesController < ApplicationController
    layout "letter_thief/application"

    before_action :turn_off_csp_nonce_generation
    skip_before_action :verify_authenticity_token, only: :create
    before_action :set_email, only: [:show, :destroy]

    content_security_policy do |policy|
      policy.style_src :self, :https, :unsafe_inline
    end

    PAGE_SIZE = 20

    def index
      @search = LetterThief::EmailSearch.new(params).perform
    end

    def create
      @email = EmailMessage.new(JSON.parse(params[:email_message]))
      render :show
    end

    def show
    end

    def destroy
      redirect_to email_messages_path if @email.destroy
    end

    def destroy_all
      EmailMessage.destroy_all
      redirect_to email_messages_path, notice: "All email messages have been deleted"
    end

    private

    def set_email
      @email = EmailMessage.find(params[:id])
    end

    def email_message_params
      params.require(:email_message).permit!
    end

    def turn_off_csp_nonce_generation
      request.content_security_policy_nonce_directives = []
    end
  end
end
