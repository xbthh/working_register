class CategoriesController < ApplicationController
    def index
      @categories = Category.where("user_id = ?",current_user)
    end

    def new
      @category = Category.new
    end

    def show
      @category = Category.find(params[:id])
    end

    def edit
      @category = Category.find(params[:id])
    end

    def update
      @category = Category.find(params[:id])

      if @category.update(category_params)
        redirect_to categories_path, notice: " category Update Success"
      else
        render :edit
      end
    end

    def destroy
      @category = Category.find(params[:id])

      @category.destroy
      flash[:alert] = "Category deleted"
      redirect_to categories_path
    end

    def create
      @category = Category.new(category_params)
      @category.user = current_user

      if @category.save
        redirect_to categories_path
      else
        render :new
      end
    end

    private

    def category_params
      params.require( :category).permit(:name)
    end

  end
