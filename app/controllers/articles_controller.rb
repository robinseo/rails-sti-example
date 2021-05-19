class ArticlesController < ApplicationController
  before_action :find_resource, only: [:show, :edit]

  def index
    @resources = resource_class
                     .where(query_params)
                     .order(order_params)
                     .page(page_params[:page])
                     .per(page_params[:per] || 200)

  end

  def show; end

  def new
    resource_class
  end

  def create
    resource_class.create(resource_params)
    redirect_to action: :index
  end

  def edit; end

  def update

  end

  def destroy

  end

  private

  def resource_name
    @resource_name ||= self.controller_name.singularize
  end

  def resource_class
    @resource_class ||= resource_name.classify.constantize
  end

  def resource_variable
    "@#{resource_name}"
  end

  def plural_resource_variable
    "@#{resource_name.pluralize}"
  end

  def query_params
    {}
  end

  def order_params
    {}
  end

  def page_params
    params.permit(:page, :per)
  end

  def find_resource
    @resource = resource_class.find(params[:id])
  end

  def resource_params
    params.require(resource_name).permit(:title, :content, :category)
  end

end
