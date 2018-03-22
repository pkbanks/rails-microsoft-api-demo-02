module MicrosoftHelper

  CLIENT_ID = ENV['MICROSOFT_ID']
  CLIENT_SECRET = ENV['MICROSOFT_SECRET']

  SCOPES = [ 'openid',
             'profile',
             'Contacts.Read'
            ]

  # Generates the login URL for the app.
  def microsoft_api_login_url
    client = OAuth2::Client.new(CLIENT_ID,
                                CLIENT_SECRET,
                                :site => 'https://login.microsoftonline.com',
                                :authorize_url => '/common/oauth2/v2.0/authorize',
                                :token_url => '/common/oauth2/v2.0/token')

    login_url = client.auth_code.authorize_url(
      :redirect_uri => ms_authorize_url,
      :scope => SCOPES.join(' ')
      )

  end

  def mircosoft_token_from_code(auth_code)
    client = OAuth2::Client.new(CLIENT_ID,
                                CLIENT_SECRET,
                                :site => 'https://login.microsoftonline.com',
                                :authorize_url => '/common/oauth2/v2.0/authorize',
                                :token_url => '/common/oauth2/v2.0/token')

    token = client.auth_code.get_token(auth_code,
                                       :redirect_uri => ms_authorize_url,
                                       :scope => SCOPES.join(' '))
  end

  def get_mstoken_from_hashed_token(hashed_token)
    
    client = OAuth2::Client.new(CLIENT_ID,
                                CLIENT_SECRET,
                                :site => 'https://login.microsoftonline.com',
                                :authorize_url => '/common/oauth2/v2.0/authorize',
                                :token_url => '/common/oauth2/v2.0/token')

    OAuth2::AccessToken.from_hash(client, hashed_token)
  end

  def run_me
    return 1
  end

end