Rails.application.routes.draw do
  
  # This will make the URL /api/comments instead of just /comments
  scope path: "api" do
    resources :comments
  end

end