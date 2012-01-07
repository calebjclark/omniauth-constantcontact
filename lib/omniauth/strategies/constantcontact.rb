require 'omniauth/strategies/oauth'
require 'multi_xml'

module OmniAuth
  module Strategies
    class ConstantContact < OmniAuth::Strategies::OAuth
      option :name, "constantcontact"

      option :client_options, {
          :site => 'https://oauth.constantcontact.com',
          :request_token_path => '/ws/oauth/request_token',
          :access_token_path => '/ws/oauth/access_token',
          :authorize_path => '/ws/oauth/confirm_access'
      }

      uid do
        request.params['username']
      end

      info do
        {
            :email => raw_info['feed']['entry']['content']['Email']['EmailAddress']
        }
      end

      extra do
        { 'raw_info' => raw_info }
      end

      def raw_info
        @raw_info ||= MultiXml.parse(access_token.get("https://api.constantcontact.com/ws/customers/" + request.params['username'] + "/settings/emailaddresses").body)
      end
    end
  end
end

OmniAuth.config.add_camelization 'constantcontact', 'ConstantContact'
