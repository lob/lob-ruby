module Lob
  class LobError < StandardError
    attr_reader :http_status, :http_body, :json_body

    def initialize(message, http_status=nil, http_body=nil, json_body=nil)
      @http_status = http_status
      @http_body = http_body
      @json_body = json_body
      status_string = @http_status.nil? ? "" : "(Status #{@http_status}) "
      super("#{status_string}#{message} \n #{@http_body}")
    end
  end
end
