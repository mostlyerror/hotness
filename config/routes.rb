Rails.application.routes.draw do
  namespace :api do
    get "notes" => "notes#index"
    post "notes" => "notes#create"
  end

  get "*path", to: "application#frontend", constraints: ->(request) { frontend_request?(request) }

  def frontend_request?(request)
    !request.xhr? && request.format.html?
  end
end
