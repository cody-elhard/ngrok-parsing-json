class HandleJsonController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # Simply download JSON request to a debug file
    json = JSON.parse(request.body.read)
    id = json['id']
    File.open("debug-#{id}.json", 'w') { |file| file.write(json.to_json) }
    # Once we have the JSON, lets map out the product names
    product_names = json['products'].map { |product| product['name'] }
    File.open("debug-names-#{id}.json", 'w') { |file| file.write(product_names.to_json) }
    render json: { status: 'ok' }
  end
end
