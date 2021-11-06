class ApplicationController < ActionController::Base
  def frontend
    render file: "public/index.html", layout: false
  end
end
