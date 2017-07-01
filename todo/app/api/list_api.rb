class ListApi < Grape::API
  format :json
  prefix :todo
  version '1', using: :param, parameter: 'v1'

  helpers do
    def permit_params
      ActionController::Parameters.new(params)
    end

    def list_params
      permit_params.require(:list).permit(:message, :status)
    end
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    # status 404
    error!(e, 404)
  end

  rescue_from :all

    # /api/todo/lists?v=v1
  resources :lists do
    # GET /api/todo/lists?v=v1
    desc 'List' do
      success ListsEntity.documentation
    end

    get do
      @lists = List.all
      #@lists.map { |list| ListSerializer.new(list)}
      present @lists, with: ListsEntity
    end

    get ':id' do
      present List.find(params[:id]), with: ListsEntity
    end

    # POST /api/mobile/products?v=1
    desc 'Create a List'
    params do
      requires :list, type: Hash do
        requires :message, type: String
        requires :status, type: Integer
      end
    end

    post do
      List.create(list_params)
      # ListCreateCommand.call(list_params) do
      #   on(:ok) do |list|
      #     present list, with: ListEntity
      #   end
      #   on(:fail) do |list|
      #     present errors: list.errors
      #   end
      # end
    end

    desc 'Update a list.'
    params do
      requires :list, type: Hash do
        #requires :id, type: String
        requires :message, type: String
        requires :status, type: Integer
      end
    end
    put ':id' do
      List.find(params[:id]).update(
        list_params
      )
    end

    desc 'Delete a list.'
    delete ':id' do
      List.find(params[:id]).destroy
    end
  end



  add_swagger_documentation(
    mount_path: '/swagger_doc'
  )

end
