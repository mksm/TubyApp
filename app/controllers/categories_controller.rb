class CategoriesController < ApplicationController
  load_and_authorize_resource

  def create
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: 'Category was successfully destroyed.'
  end

  private
    def category_params
      params.require(:category).permit(:name_en, :name_ar)
    end
end
