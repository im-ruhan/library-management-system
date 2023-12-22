class LibrariesController < ApplicationController
    def create
        library = Library.new(library_params)
        if library.save
            render json: LibrarySerializer.new(library), status: :created
        else
            render json: @library.errors, status: :unprocessable_entity
        end
    end

    private

    def library_params
        params.permit(:library).requrie(:name)
    end
end
