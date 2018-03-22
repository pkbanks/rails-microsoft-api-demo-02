class AuthController < ApplicationController
  include MicrosoftHelper

  def ms_gettoken
    token = mircosoft_token_from_code params[:code]
    puts "*** token ***"
    p "#{token}"
    render plain: 'success!'
  end
end
