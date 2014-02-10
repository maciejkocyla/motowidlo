module CategoriesHelper

  def main_categories
    categories = Array.new
    Category.all.each do |cat|
      if cat.overcategory.nil?
        categories.push(cat)
      end
    end
    return categories
  end

  def active_overcategory
    if params[:controller] == "categories" && params[:id]
      if Category.find_by(id: params[:id]).overcategory
        Category.find_by(id: params[:id]).overcategory
      else
        Category.find_by(id: params[:id])
      end
    elsif params[:controller] && params[:category_id]
      if Category.find_by(id: params[:category_id]).overcategory
        Category.find_by(id: params[:category_id]).overcategory
      else
        Category.find_by(id: params[:category_id])
      end
    end
  end
end
