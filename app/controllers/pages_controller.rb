class PagesController < ApplicationController

  def homepage
    redirect_to categories_path
  end

end
