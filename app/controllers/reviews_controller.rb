class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :load_review, except: [:index, :new, :create]

  def index
    @reviews = Review.order "created_at DESC"
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new review_params
    if @review.save
      redirect_to reviews_path, notice: "The review has been successfully created."
    else
      render action: "new"
    end
  end

  def edit
  end

  def update
    if @review.update_attributes review_params
      redirect_to reviews_path, notice: "The review has been successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    if @review.nil?
      flash.now[:danger] = "The review does not exist."
    else
      @review.destroy
      flash[:success] = "The review has been deleted."
    end
    redirect_to :back
  end

  private
  def load_review
    @review = Review.find params[:id]
  end

  def review_params
    params.require(:review).permit :title, :content
  end
end
