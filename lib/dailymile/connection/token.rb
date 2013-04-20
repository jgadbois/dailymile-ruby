module Dailymile
  
  class Connection::Token < Connection
    
    def initialize(client, token)
      @client = client
      set_access_token token
    end
    
    def access_token=(token)
      set_access_token token
    end
    
  private
  
    def request(verb, path, params = {}, headers = {})
      make_request(verb, path, params, headers) do |verb, path, params, headers|
        params[:headers] = headers
        @access_token.request(verb, path, params)
      end
    end
    
    def set_access_token(token)
      @access_token = OAuth2::AccessToken.new(@client, token, :param_name=>'oauth_token')
      #@access_token.token_param = 'oauth_token'
    end
    
  end
  
end
