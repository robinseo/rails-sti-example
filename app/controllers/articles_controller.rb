class ArticlesController < ApplicationController
  def index
    resources = base_index_query
                    .where(query_params)
                    .order(order_args)
                    .page(page_params[:page])
                    .per(page_params[:per])

    instance_variable_set(plural_resource_variable, resources)
  end

  def new
    instance_variable_set(resource_variable, resource_class.new)
  end

  private
  def resource_name
    @resource_name ||= self.controller_name.singularize
  end

  def resource_class
    @resource_class ||= resource_name.classify.constantize
  end

  def base_index_query
    resource_class.all
  end

  def query_params
    {}
  end

  def page_params
    params.permit(:page, :per)
  end

  def order_args
    :created_at
  end

  def resource_variable
    "@#{resource_name}"
  end

  def plural_resource_variable
    "@#{resource_name.pluralize}"
  end

end
