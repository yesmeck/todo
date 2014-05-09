class TemplatesController < ApplicationController
  def index

  end

  def template
    render 'templates/' + params[:path], :layout => nil
  end
end
