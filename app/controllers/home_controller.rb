class HomeController < ApplicationController
  include MicrosoftHelper

  def index
    @microsoft_url = microsoft_api_login_url
    p run_me
  end

  def thankyou
    @msg = "Thank you!"
  end
end
