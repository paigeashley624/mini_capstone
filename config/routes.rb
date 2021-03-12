Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    #   get "/products_path", controller: "products", action: "available_products"
    #   post "", cotroller: "", action: ""

    get "/products", controller: "products", action: "index"

    get "/products/:id", controller: "products", action: "show"

    post "/products", controller: "products", action: "create"

    patch "/products/:id", controller: "products", action: "update"

    delete "/products/:id", controller: "products", action: "destroy"

    post "/sessions", controller: "sessions", action: "create"

    post "/orders", controller: "orders", action: "create"
  end
end
