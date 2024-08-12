class HandleJsonController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # Simply download JSON request to a debug file
    json = JSON.parse(request.body.read)
    File.open('debug.json', 'w') { |file| file.write(json) }
    render json: { status: 'ok' }
  end
end
