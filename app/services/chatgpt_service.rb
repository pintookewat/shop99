require 'httparty'
class ChatgptService
  include HTTParty

  attr_reader :api_url, :options, :model, :message

  def initialize(message, model = 'gpt-3.5-turbo', controller)
    @api_key = "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"
    @options = {
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{@api_key}"
      }
    }
    @api_url = 'https://api.openai.com/v1/chat/completions'
    @model = model
    @message = message
    @controller = controller
  end

  def call
    body = {
      model: @model,
      messages: [{ role: 'user', content: @message }]
    }
    response = HTTParty.post(@api_url, body: body.to_json, headers: options[:headers], timeout: 10)
      begin 
        @message  = response['choices'][0]['message']['content']
      rescue StandardError => e
        @message = response['error']['message'] 
      end
      @controller.redirect_to "/homeuser/chatgpt?message=#{@message}"
  end

  class << self
    def call(message, model = 'gpt-3.5-turbo')
      new(message, model).call
    end
  end
end
