Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    #   get "/products_path", controller: "products", action: "available_products"
    #   post "", cotroller: "", action: ""

    get "/products", controller: "products", action: "all_products"

    get "/products/:id", controller: "products", action: "show"

    post "/products", controller: "products", action: "create"

    patch "/products/:id", controller: "products", action: "update"

    delete "/products/:id", controller: "products", action: "destroy"
  end
end
