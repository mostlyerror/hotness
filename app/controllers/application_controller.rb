class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def frontend
    render file: "public/index.html", layout: false
  end
end
