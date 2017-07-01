class ListCreateCommand < Rectify::Command
  def initialize(list_params)
    @list_params = list_params
  end

  def call
    list = List.new(list_params)
    if list.save
      broadcast(:ok, list)
    else
      broadcast(:fail, list)
    end
  end

  private

  attr_reader :list_params
end
