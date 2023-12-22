Rails.application.routes.draw do
  resources :libraries, only: [:create] do
    resources :books, only: [:create]
    resources :borrowers, only: [:create]
  end

  resources :books, only: [] do
    collection do
      get :find_by_title
    end
  end

  resources :borrowings, only: [] do
    collection do
      post :lend_books
      post :return_books
    end
  end

  resources :fines, only: [] do
    collection do
      get :get_fine
      post :pay_fine
    end
  end
end
