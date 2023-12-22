RSpec.describe BooksController, type: :controller do
    let(:library) { create(:library) }
  
    describe 'POST #create' do
      it 'creates a new book' do
        post :create, params: { library_id: library.id, book: attributes_for(:book) }
        expect(response).to have_http_status(:created)
        expect(Book.count).to eq(1)
      end
  
      it 'returns unprocessable_entity status on invalid data' do
        post :create, params: { library_id: library.id, book: { invalid: 'data' } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  
    describe 'GET #find_by_title' do
      let(:book1) { create(:book, library: library, title: 'Harry Potter 1') }
      let(:book2) { create(:book, library: library, title: 'Harry Potter 2') }
  
      it 'returns books matching partial title within a library' do
        get :find_by_title, params: { library_id: library.id, title: 'Harry', format: :json }
        expect(response).to have_http_status(:ok)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response.length).to eq(2)
      end
  
      it 'returns books matching partial title globally' do
        get :find_by_title, params: { title: 'Harry', global_search: true, format: :json }
        expect(response).to have_http_status(:ok)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response.length).to eq(2)
      end
    end
  end
  